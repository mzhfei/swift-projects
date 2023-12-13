//
//  ProductDetailView.swift
//  TouchDown
//
//  Created by Mengzhe Fei on 2023-12-12.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            // navbar
            NavigationbarDetailView()
                .padding(.horizontal)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            // header
            HeaderDetailedView()
                .padding(.horizontal)
                
                
            // detail top part
            TopPartDetailView()
                .padding(.horizontal)
                .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)

            // detail bottom part
            BottomPartDetailView()
                .padding(.horizontal)
                .background(
                  Color.white
                    .clipShape(CustomShape())
                    .padding(.top, -105)
                )
        })// vs
        .zIndex(0)
        .ignoresSafeArea(.all, edges: .all)
        .background(
            (shop.selectedProduct?.colorOut ?? sampleProduct.colorOut)
                .ignoresSafeArea(.all, edges: .all)
        )
    }
}

#Preview {
    ProductDetailView()
        .environmentObject(Shop())
        .previewLayout(.fixed(width: 375, height: 812))
}
