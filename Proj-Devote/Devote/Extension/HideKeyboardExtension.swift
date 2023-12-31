//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Mengzhe Fei on 2023-12-19.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}

#endif

