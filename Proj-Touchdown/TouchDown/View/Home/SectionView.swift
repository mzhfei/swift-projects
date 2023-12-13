//
//  SectionView.swift
//  TouchDown
//
//  Created by Mengzhe Fei on 2023-12-12.
//

import SwiftUI

struct SectionView: View {
    @State var rotateClockwise: Bool
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Text("Categories".uppercased())
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees:  rotateClockwise ? 90 : -90))
            Spacer()
        }//vs
        .background(colorGray.cornerRadius(12))
        .frame(width: 85)
    }
}

#Preview {
    SectionView(rotateClockwise: false)
        .previewLayout(.sizeThatFits)
        .padding()
}
