//
//  ContentView.swift
//  Hike
//
//  Created by Mengzhe Fei on 2023-11-29.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        CardView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
