//
//  Constant.swift
//  Devote
//
//  Created by Mengzhe Fei on 2023-12-19.
//

import Foundation
import SwiftUI

// MARK: - formatter

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// MARK: - UI
var backgroundGradient: LinearGradient {
  return LinearGradient(
    gradient: Gradient(colors: [Color.mint, Color.cyan]),
    startPoint: .topLeading,
    endPoint: .bottomTrailing)
}
// MARK: - UX
let feedback = UINotificationFeedbackGenerator()
