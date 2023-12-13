//
//  OnboardingView.swift
//  Fructus
//
//  Created by Mengzhe Fei on 2023-12-09.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: properties
    var fruits: [Fruit] = fruitsData
    
    // MARK: body

    var body: some View {
        TabView{
            ForEach(fruits){ fruit in
                FruitCardView(fruit: fruit)
            }
        }//: tabview
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

// MARK: preview
#Preview {
    OnboardingView(fruits: fruitsData)
    
}
