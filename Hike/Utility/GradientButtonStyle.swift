//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Mengzhe Fei on 2023-11-30.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // Conditional Statement with nil coalescing
                // Conditional ? A : B
                configuration.isPressed ?
                LinearGradient(colors: [.colorGrayLight, .colorGrayMedium], startPoint: .top, endPoint: .bottom) :
                    LinearGradient(colors: [.colorGrayMedium, .colorGrayLight], startPoint: .top, endPoint: .bottom)
                // A: Pressed
                // B: not pressed
                            ).cornerRadius(40)
    }
}
