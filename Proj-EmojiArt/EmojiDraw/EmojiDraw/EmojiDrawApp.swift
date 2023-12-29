//
//  EmojiDrawApp.swift
//  EmojiDraw
//
//  Created by Mengzhe Fei on 2023-12-25.
//

import SwiftUI

@main
struct EmojiDrawApp: App {
    @StateObject var defaultDocument = EmojiArtDocument()
    @StateObject var paletteStore = PaletteStore(named: "Main")
    @StateObject var paletteStore2 = PaletteStore(named: "Main2")
    @StateObject var paletteStore3 = PaletteStore(named: "Main3")
    
    var body: some Scene {
        WindowGroup {
            PaletteManger(stores: [paletteStore,paletteStore2,paletteStore3])
//            EmojiArtDocumentView(document: defaultDocument)
                .environmentObject(paletteStore)
        }
    }
}
