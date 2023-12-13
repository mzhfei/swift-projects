//
//  RatingSizeView.swift
//  TouchDown
//
//  Created by Mengzhe Fei on 2023-12-12.
//

import SwiftUI

struct RatingSizeView: View {
    let sizes: [String] = ["XS", "S", "M", "L", "XL", "XXL"]
    
    
    var body: some View {
        HStack(alignment: .top, spacing: 3, content: {
            VStack(alignment: .leading, spacing: 3, content: {
                Text("Ratings")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(colorGray)
                
                HStack(alignment: .center, spacing: 3, content: {
                    ForEach(1...5, id: \.self) { item in
                        Button {
                            
                        } label: {
                            Image(systemName: "star.fill")
                                .frame(width: 28, height: 28, alignment: .center)
                                .background(colorGray.cornerRadius(5))
                                .foregroundStyle(.white)
                        }

                    }
                })// hs
            })// vs
            Spacer()
            
            VStack(alignment: .trailing, spacing: 3, content: {
                Text("Sizes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(colorGray)
                
                HStack(alignment: .center, spacing: 5, content: {
                    ForEach(sizes, id: \.self) { size in
                        Button {
                            
                        } label: {
                            Text(size)
                                .font(.footnote)
                                .fontWeight(.heavy)
                                .foregroundStyle(colorGray)
                                .frame(width: 28, height: 28, alignment: .center)
                                .background(Color.white.clipShape(
                                    RoundedRectangle(cornerRadius: 5)))
                                .background(RoundedRectangle(cornerRadius: 5)
                                    .stroke( colorGray, lineWidth: 2)
                                )
                        
                        }

                    }
                })// hs

            })
            
        })
    }
}

#Preview {
    RatingSizeView()
        .previewLayout(.sizeThatFits)
        .padding()
        .background(colorBackground)
}
