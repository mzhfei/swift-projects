//
//  ProductGridView.swift
//  TouchDown
//
//  Created by Mengzhe Fei on 2023-12-12.
//

import SwiftUI

struct ProductGridView: View {
    @EnvironmentObject var shop: Shop

    var body: some View {
        LazyVGrid(columns: gridLayout, spacing: 15, content: {
            ForEach(products) { product in
                ProductItemView(product: product)
                    .onTapGesture {
                        shop.setShowingProduct(b: true)
                        shop.setSelectedProduct(p: product)
                    }
            }
        })
        .padding(15)
    }
}

#Preview {
    ProductGridView()
        .environmentObject(Shop())

}
