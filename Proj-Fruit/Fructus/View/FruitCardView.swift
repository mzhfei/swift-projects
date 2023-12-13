//
//  FruitCardView.swift
//  Fructus
//
//  Created by Mengzhe Fei on 2023-12-09.
//

import SwiftUI

struct FruitCardView: View {
    // MARK: properties
    @State private var isAnimating: Bool = false
    var fruit: Fruit
    // MARK: body
    
    
    var body: some View {
        ZStack {
            VStack(spacing:20){
                // FRUIT: image
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red:0, green:0, blue:0, opacity: 0.15), radius: 8, x: 6, y: 8)
                
                // FRUIT: title
                Text(fruit.title)
                    .foregroundStyle(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: Color(red:0, green:0, blue:0, opacity: 0.15), radius: 2, x: 2, y: 2)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                
                // FURIT: headline
                Text(fruit.headline)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                
                // BUTTON: start
                StartButtonView()
            }//: Vstack
        } //: Zstack
        .onAppear{
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(
            LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}

// MARK: preview

#Preview {
    FruitCardView(fruit: fruitsData[1])
        .previewLayout(.fixed(width:320, height: 640))
}
