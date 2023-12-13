//
//  TouchDownApp.swift
//  TouchDown
//
//  Created by Mengzhe Fei on 2023-12-12.
//

import SwiftUI

@main
struct TouchDownApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
