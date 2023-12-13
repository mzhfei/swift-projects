//
//  CardView.swift
//  Hike
//
//  Created by Mengzhe Fei on 2023-11-30.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    @State private var isShowingSheet: Bool = false;
    @State private var imageNumber: Int = 1
    
    // MARK: - Functions
    
    func randomImage() {
        var randomNumber: Int
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        imageNumber = randomNumber
    }
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                // MARK: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                            LinearGradient(colors: [.colorGrayLight, .colorGrayMedium], startPoint: .top, endPoint: .bottom))
                        
                        Spacer()
                        
                        Button{
                            // ACTION: show a sheet
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    Text("Fun and enjoyable outdoor activity for friends and families")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal, 30)
                // MARK: - MAIN CONTENT
                ZStack{
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                // MARK: - FOOTER
                Button {
                    // ACTION
                    randomImage()
                } label: {
                    Text("Explore more")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenDark], startPoint: .top, endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }.buttonStyle(GradientButton())
            }//: Vstack
        } //: CARD
        .frame(width:320, height: 570)
    }
}

#Preview {
    CardView()
}
