//
//  EmojiArtDocument.swift
//  EmojiDraw
//
//  Created by Mengzhe Fei on 2023-12-25.
//

import Foundation
import SwiftUI

class EmojiArtDocument: ObservableObject {
    typealias Emoji = EmojiArt.Emoji
    
    @Published private var emojiArt = EmojiArt()
    
    init() {
        emojiArt.addEmoji("🐭", at: .init(x: 145, y: -135), size: 200)
    }
    
    var emojis: [Emoji] {
        emojiArt.emojis
    }
    
    var backgrounds: URL? {
        emojiArt.background
    }
    
    // MARK: - Intents
    func setBackground(_ url: URL?) {
        emojiArt.background = url
    }
    
    func addEmoji(_ emoji: String, at position: Emoji.Position, size: CGFloat) {
        emojiArt.addEmoji(emoji, at: position, size: Int(size))
        
    }

}


extension EmojiArt.Emoji {
    var font: Font {
        Font.system(size: CGFloat(size))
    }
}

extension EmojiArt.Emoji.Position {
    func `in`(_ geometry: GeometryProxy) -> CGPoint {
        let center = geometry.frame(in: .local).center
        return CGPoint(
            x: center.x + CGFloat(x),
            y: center.y - CGFloat(y))
    }
}