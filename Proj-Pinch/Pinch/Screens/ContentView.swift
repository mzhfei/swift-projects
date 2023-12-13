//
//  ContentView.swift
//  Pinch
//
//  Created by Mengzhe Fei on 2023-12-03.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    @State private var isDrawerOpen: Bool = true
    
    let pages: [Page] = pagesData
    @State private var pageIndex: Int = 1
    
    //MARK: - function
    func resetImageState(){
        withAnimation(.spring) {
            imageOffset = .zero
            imageScale = 1
        }
    }
    

    func currentPage() -> String {
        return pages[pageIndex].imageName
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.clear
                //MARK: - page image
                Image(currentPage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.linear(duration: 1), value: isAnimating)
                    .offset(CGSize(width: imageOffset.width, height: imageOffset.height))
                    .scaleEffect(imageScale)
                //MARK: tap gesture
                    .onTapGesture(count: 2, perform: {
                            if imageScale == 1 {
                                withAnimation(Animation.spring){
                                    imageScale = 5
                                }
                            } else {
                                resetImageState()
                            }
                    })//: tap gesture
                //MARK: drag gesture
                    .gesture(
                        DragGesture()
                            .onChanged{ value in
                                withAnimation(.linear) {
                                    imageOffset = value.translation
                                }
                            }
                            .onEnded{ value in
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                    )//: drag gesture
                // MARK: magnification
                    .gesture(
                        MagnificationGesture()
                            .onChanged({ value in
                                withAnimation(.linear(duration: 1)) {
                                    if imageScale >= 1 && imageScale <= 5 {
                                        imageScale = value
                                    } else if imageScale > 5{
                                        imageScale = 5
                                    }
                                }
                            })
                            .onEnded({ value in
                                withAnimation(.linear(duration: 1)) {
                                    if imageScale > 5{
                                        imageScale = 5
                                    } else if imageScale < 1 {
                                        resetImageState()
                                    }
                                }
                            })
                    )
                    
            }//: Zstack
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                    isAnimating = true
            })
            //MARK: info panel
            .overlay(
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
                , alignment: .top
            )
            //MARK: controls
            .overlay(
                Group{
                    HStack{
                        // scale down
                        Button {
                            withAnimation(.spring()) {
                                if imageScale > 1 {
                                    imageScale -= 1
                                    
                                    if imageScale <= 1 {
                                        resetImageState()
                                    }
                                }
                            }
                        } label: {
                            ControlImageView(icon: "minus.magnifyingglass")
                        }
                        
                        // reset
                        Button {
                            withAnimation(.spring()) {
                                resetImageState()
                            }
                        } label: {
                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        // scale up
                        
                        Button {
                            withAnimation(.spring()) {
                                if imageScale <= 5 {
                                    imageScale += 1
                                    
                                    if imageScale >= 1 {
                                        imageScale = 5
                                    }
                                }
                            }
                        } label: {
                            ControlImageView(icon: "plus.magnifyingglass")
                        }
                    }// controls
                    .padding(EdgeInsets(top:12, leading:20, bottom:12, trailing:20))
                    .background(.ultraThinMaterial)
                    .opacity(isAnimating ? 1 : 0)
                }
                    .padding(.bottom, 30)
                , alignment: .bottom
            )
            //MARK: - drawer
            .overlay(
                HStack(spacing: 12) {
                    // MARK: - drawer handle
                    Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
                        .resizable()
                        .scaledToFit()
                        .frame(height:40)
                        .padding(8)
                        .foregroundStyle(.secondary)
                        .onTapGesture {
                            withAnimation(.easeOut) {
                                isDrawerOpen.toggle()
                            }
                        }
                    
                    // MARK: - thumbnails
                    
                    ForEach(pages) { page in
                        Image(page.thumbnailName)
                            .resizable()
                            .scaledToFit()
                            .frame(width:80)
                            .cornerRadius(8)
                            .shadow(radius:4)
                            .opacity(isDrawerOpen ? 1 : 0)
                            .animation(.easeOut(duration: 0.5), value: isDrawerOpen)
                            .onTapGesture {
                                pageIndex = page.id
                                isAnimating = true
                                isDrawerOpen = false
                            }
                    }
                    Spacer()
                }//:drawer
                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                    .frame(width: 260)
                    .padding(.top, UIScreen.main.bounds.height / 12)
                    .offset(x: isDrawerOpen ? 20 : 215)
                , alignment: .topTrailing
            )
        }//: Navigation View
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}
