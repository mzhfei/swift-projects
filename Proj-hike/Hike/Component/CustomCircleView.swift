//
//  CustomCircleView.swift
//  Hike
//
//  Created by Mengzhe Fei on 2023-11-30.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [.customIndigoMedium, .colorSalmonLight],
                        startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimateGradient ? .bottomTrailing : .topLeading))
                .onAppear{
                    withAnimation(.linear(duration: 6.0).repeatForever(autoreverses: true)) {
                        isAnimateGradient.toggle()
                    }
                }
            MotionAnimationView()
        }        //: Zstack
        .frame(width: 256, height: 256)

    }
}

#Preview {
    CustomCircleView()
}
