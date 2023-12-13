//
//  Item.swift
//  Hike
//
//  Created by Mengzhe Fei on 2023-11-29.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
