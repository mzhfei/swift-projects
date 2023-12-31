//
//  EmojiDrawApp.swift
//  EmojiDraw
//
//  Created by Mengzhe Fei on 2023-12-25.
//

import SwiftUI

@main
struct EmojiDrawApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: { EmojiArtDocument() } ) { config in
            EmojiArtDocumentView(document: config.document)
                .withAutomaticToolbarRole()
        }
    }
}
