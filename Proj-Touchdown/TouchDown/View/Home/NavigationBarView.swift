//
//  NavigationBarView.swift
//  TouchDown
//
//  Created by Mengzhe Fei on 2023-12-12.
//

import SwiftUI

struct NavigationBarView: View {
    // MARK: - property
    @State private var isAnimated: Bool = false
    
    var body: some View {
        HStack {
            Button(action: {}, label:{
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.black)
            })
            
            Spacer()
            LogoView()
                .opacity(isAnimated ? 1: 0)
                .offset(x:0, y: isAnimated ? 0 : -25)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 1)){
                        isAnimated.toggle()
                    }
                })
            Spacer()
            
            Button(action: {}, label:{
                ZStack {
                    Image(systemName: "cart")
                        .font(.title)
                    .foregroundColor(.black)
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 14, height: 14, alignment: .center)
                        .offset(x: 13, y: -10)
                }//zs
            })
        }// hstack
    }
}

#Preview {
    NavigationBarView()
        .previewLayout(.sizeThatFits)
        .padding()
}
