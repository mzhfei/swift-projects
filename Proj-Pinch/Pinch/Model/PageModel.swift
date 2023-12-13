//
//  PageModel.swift
//  Pinch
//
//  Created by Mengzhe Fei on 2023-12-04.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
