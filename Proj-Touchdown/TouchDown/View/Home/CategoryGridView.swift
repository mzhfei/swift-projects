//
//  CategoryGridView.swift
//  TouchDown
//
//  Created by Mengzhe Fei on 2023-12-12.
//

import SwiftUI

struct CategoryGridView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(
                rows: gridLayout, 
                alignment: .center,
                spacing: columnSpacing,
                pinnedViews: [],
                content: {
                    Section(
                        header: SectionView(rotateClockwise: false),
                        footer: SectionView(rotateClockwise: true)) {
                            ForEach(categories) { category in
                                CategoryItemView(category: category)
                            }
                    }
            })//grid
            .frame(height: 140)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            
        }
    }
}

#Preview {
    CategoryGridView()
        .previewLayout(.sizeThatFits)
        .padding()
        .background(colorBackground)
        .environmentObject(Shop())
    
}
