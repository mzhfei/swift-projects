//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Mengzhe Fei on 2023-12-01.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: -PROPERTIES
    @State private var randomCircle: Int = Int.random(in: 2...12)
    @State private var isAnimating: Bool = false;
    
    // MARK: - FUNCTIONS
    
    // 1. COORDINATE
    func randomCoordinate() -> CGFloat{
        return CGFloat.random(in: 0...256)
    }
    // 2. SIZE
    func randomSize() -> CGFloat{
        return CGFloat.random(in: 4...80)
    }
    // 3. SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // 4. SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    // 5. DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2.0)
    }
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id:\.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(x: randomCoordinate(), y: randomCoordinate())
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(
                        perform: {
                            withAnimation(.interpolatingSpring(stiffness: 0.25, damping: 0.25)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                            ) {isAnimating = true}
                        }
                    )
            }
        }//: Zstack
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    ZStack {        
        MotionAnimationView()
            .background(
                Circle().fill(.teal))
    }
}
