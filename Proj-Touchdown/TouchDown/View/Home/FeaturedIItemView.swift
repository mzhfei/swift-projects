//
//  FeaturedIItemView.swift
//  TouchDown
//
//  Created by Mengzhe Fei on 2023-12-12.
//

import SwiftUI

struct FeaturedIItemView: View {
    let player: Player
    
    var body: some View {
        Image(player.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    FeaturedIItemView(player: players[1])
        .previewLayout(.sizeThatFits)
        .padding()
}
