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
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: defaultDocument)
        }
    }
}
