//
//  CustomIconButton.swift
//  Hike
//
//  Created by Mengzhe Fei on 2023-12-01.
//

import SwiftUI

struct CustomIconButton: View {
    @State var iconName: String
    var body: some View {
        Button {
            print("\(iconName) pressed")
            UIApplication.shared.setAlternateIconName(iconName) {
                error in
                if error != nil {
                    print("Failed request to update the app's icon: \(String(describing: error?.localizedDescription))")
                } else {
                    print("Icon updated: \(iconName)")
                }
            }
        } label: {
            Image("\(iconName)-Preview")
                .resizable()
                .scaledToFit()
                .frame(width:80, height:80)
                .cornerRadius(16)
    }.buttonStyle(.borderless)    }
}

#Preview {
    CustomIconButton(iconName: "AppIcon-Backpack")
}
