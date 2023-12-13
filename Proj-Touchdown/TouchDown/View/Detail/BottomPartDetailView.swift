//
//  bottomPartDetail.swift
//  TouchDown
//
//  Created by Mengzhe Fei on 2023-12-12.
//

import SwiftUI

struct BottomPartDetailView: View {
    @EnvironmentObject var shop: Shop
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
            // rating + size
            RatingSizeView()
                .padding(.top, -20)
                .padding(.bottom, 10)
            // description
            ScrollView(.vertical, showsIndicators: false, content: {
                Text(shop.selectedProduct?.description ??  sampleProduct.description)
                    .font(.system(.body, design: .rounded))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.leading)
                
            })
            // quantity
            QuantityFavDetailView()
                .padding(.bottom, 20)

            // add to cart
            AddToCartDetailView()
                .padding(.bottom, 20)

            Spacer()
        })// vs
    }
}

#Preview {
    BottomPartDetailView()
        .environmentObject(Shop())
}
