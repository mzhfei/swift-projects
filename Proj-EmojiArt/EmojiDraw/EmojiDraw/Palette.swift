//
//  Palette.swift
//  EmojiDraw
//
//  Created by Mengzhe Fei on 2023-12-28.
//

import Foundation

struct Palette: Identifiable, Codable, Hashable {
    var name: String
    var emojis: String
    
    var id = UUID()
    
    static var builtins: [Palette] {[
        Palette(name: "Veges", emojis: "🫛🥦🥬🥒🌶️🫒🧄🥕🌽🫑🧅🍠🫚"),
        Palette(name: "Fruits", emojis: "🍏🍎🍐🍊🍋🫐🍓🍇🍉🍌🍈🍒🍑🥭🍍🥑🍆🍅🥝🥥"),
        Palette(name: "Food1", emojis: "🥐🥨🥖🍞🥯🥚🍳🧈🧇"),
        Palette(name: "Meats", emojis: "🍖🍗🥩🥓🌭🍔🍟🍕🫓🌯🌮🧆🥙🥪🫔🥗🥘🫕"),
        Palette(name: "Foods2", emojis: "🍝🍜🍲🍛🍤🦪🥟🍱🍣🍙🍚🍘🍥🥠🍡🍢🌰🥜🫘"),
        Palette(name: "Sweets", emojis: "🍨🍧🥮🍦🥧🧁🍰🎂🍿🍫🍬🍭🍮🍪🍩"),
    ]}
    
}
