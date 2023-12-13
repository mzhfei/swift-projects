//
//  QuantityFavDetailView.swift
//  TouchDown
//
//  Created by Mengzhe Fei on 2023-12-12.
//

import SwiftUI

struct QuantityFavDetailView: View {
    @State private var counter: Int = 0
    
    
    var body: some View {
        HStack(alignment: .center, spacing: 6, content: {
            Button {
                if counter > 0 {
                    counter -= 1
                }
            } label: {
                Image(systemName: "minus.circle")
            }
            
            Text("\(counter)")
                .fontWeight(.semibold)
                .frame(minWidth: 36)

            Button {
                if counter < 99 {
                    counter += 1
                }
            } label: {
                Image(systemName: "plus.circle")
            }
            
            Spacer()
            
            Button {} label: {
                Image(systemName: "heart.circle")
                    .foregroundStyle(.pink)
            }
        })//hs
        .font(.system(.title, design: .rounded))
        .foregroundStyle(.black)
        .imageScale(.large)
    }
}

#Preview {
    QuantityFavDetailView()
        .previewLayout(.sizeThatFits)
        .padding()
}
