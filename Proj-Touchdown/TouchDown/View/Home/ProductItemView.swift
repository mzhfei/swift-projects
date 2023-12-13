//
//  ProductItemView.swift
//  TouchDown
//
//  Created by Mengzhe Fei on 2023-12-12.
//

import SwiftUI

struct ProductItemView: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            // photo
            ZStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                .padding(20)
            }//zs
            .background(product.colorOut)
            .cornerRadius(12)
            // name
            
            Text(product.name)
                .font(.title3)
                .fontWeight(.black)
            
            // price
            Text(product.formattedPrice)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
        })// vs
    }
}

#Preview {
    ProductItemView(product: products[0])
        .previewLayout(.fixed(width: 200, height: 300))
        .padding()
}
