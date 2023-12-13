//
//  HeaderDetailedView.swift
//  TouchDown
//
//  Created by Mengzhe Fei on 2023-12-12.
//

import SwiftUI

struct HeaderDetailedView: View {
    @EnvironmentObject var shop: Shop
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            Text("Protective Gear")
            
            Text(shop.selectedProduct?.name ?? sampleProduct.name)
                .font(.largeTitle)
                .fontWeight(.bold)
        })
    }
}

#Preview {
    HeaderDetailedView()
        .environmentObject(Shop())
}
