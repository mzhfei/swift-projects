//
//  FructusApp.swift
//  Fructus
//
//  Created by Mengzhe Fei on 2023-12-08.
//

import SwiftUI

@main
struct FructusApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
//              OnboardingView()

            if (isOnboarding) {
                OnboardingView(fruits: fruitsData)
            } else {
                ContentView()
            }
        }
    }
}
