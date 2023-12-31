//
//  ContentView.swift
//  TouchDown
//
//  Created by Mengzhe Fei on 2023-12-12.
//

import SwiftUI

struct ContentView: View {
    // MARK: - property
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        ZStack {
            if shop.showingProduct == false && shop.selectedProduct == nil {
                VStack(spacing: 0) {
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .background(.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)

                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 0, content: {
                            FeaturedTabView()
                                .padding(.vertical, 20)
                                .frame(height: UIScreen.main.bounds.width / 1.475)

                            CategoryGridView()
                            
                            TitleView(title: "Helmet")
                            
                            ProductGridView()
                            
                            TitleView(title: "Brands")
                            BrandGridView()
                            
                            FooterView()
                                .padding(.horizontal)
                        })//vs
                    })//scroll v

                }//vs
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            } else {
                ProductDetailView()
            }
        }//zs
        .ignoresSafeArea(.all, edges: .top)
    }
}

#Preview {
    ContentView()
        .environmentObject(Shop())
}
