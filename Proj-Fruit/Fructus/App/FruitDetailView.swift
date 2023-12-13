//
//  FruitDetailView.swift
//  Fructus
//
//  Created by Mengzhe Fei on 2023-12-09.
//

import SwiftUI

struct FruitDetailView: View {
    //MARK: properties
    var fruit: Fruit
    
    //MARK: body
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                    // header
                    FruitHeaderView(fruit: fruit)
                    
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20) {
                        // title
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(fruit.gradientColors[1])
                        
                        
                        // headlines
                        Text(fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                        // nutrients
                        FruitNutrientsView(fruit: fruit)
                        // subheading
                        Text("Learn more about \(fruit.title)".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(fruit.gradientColors[1])

                        // desc
                        Text(fruit.description)
                            .multilineTextAlignment(.leading)
                        // link
                        SourceLinkView(fruitName: fruit.title)
                            .padding(.top, 10)
                            .padding(.bottom, 40)
                        
                    } // Vstack in
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                }) // Vstack out
                .navigationBarTitle(fruit.title, displayMode: .inline)
                .navigationBarHidden(true)
            }// scroll
            .ignoresSafeArea(edges: .top)
        }// nav view
        .navigationViewStyle(StackNavigationViewStyle())

    }
}

#Preview {
    FruitDetailView(fruit: fruitsData[6])
}
