//
//  ControlImageView.swift
//  Pinch
//
//  Created by Mengzhe Fei on 2023-12-03.
//

import SwiftUI

struct ControlImageView: View {
    let icon: String
    
    var body: some View {
            Image(systemName: icon)
                .font(.system(size:36))
    }
}

#Preview {
    ControlImageView(icon:"minus.magnifyingglass")
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
        .padding()
    }
