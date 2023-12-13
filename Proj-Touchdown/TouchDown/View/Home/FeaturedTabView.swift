//
//  FeaturedTabView.swift
//  TouchDown
//
//  Created by Mengzhe Fei on 2023-12-12.
//

import SwiftUI

struct FeaturedTabView: View {
    var body: some View {
        TabView {
            ForEach(players) { player in
                FeaturedIItemView(player:  player)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
            }
        }// tab view
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        
    }
}

#Preview {
    FeaturedTabView()
        .previewLayout(.sizeThatFits)
        .padding()
}
