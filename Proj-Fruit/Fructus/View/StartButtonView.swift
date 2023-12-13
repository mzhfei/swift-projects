//
//  StartButtonView.swift
//  Fructus
//
//  Created by Mengzhe Fei on 2023-12-09.
//

import SwiftUI

struct StartButtonView: View {
    // MARK: properties
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    // MARK: body
    var body: some View {
        Button(action: {
            isOnboarding = false
            print(123)
        }, label: {
            HStack(spacing: 8) {
                Text("start")
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(.white, lineWidth: 1.25)
            )
        }) //: buton
        .accentColor(.white)
        
    }
}


// MARK: preview
#Preview {
    StartButtonView()
        .previewLayout(.sizeThatFits)
}
