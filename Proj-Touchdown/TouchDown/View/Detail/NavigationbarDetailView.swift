//
//  NavigationbarDetailView.swift
//  TouchDown
//
//  Created by Mengzhe Fei on 2023-12-12.
//

import SwiftUI

struct NavigationbarDetailView: View {
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        HStack {
            Button {
                withAnimation(.easeIn) {
                    shop.clear()
                }
                
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundStyle(.white)
            }
            
            Spacer()
            Button {} label: {
                Image(systemName: "cart")
                    .font(.title)
                    .foregroundStyle(.white)
            }

        }//hstack
        
    }
}

#Preview {
    NavigationbarDetailView()
        .previewLayout(.sizeThatFits)
        .padding()
        .background(colorGray)
        .environmentObject(Shop())
}
