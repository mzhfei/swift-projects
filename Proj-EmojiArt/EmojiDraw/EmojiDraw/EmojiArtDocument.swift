//
//  EmojiArtDocument.swift
//  EmojiDraw
//
//  Created by Mengzhe Fei on 2023-12-25.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers


extension UTType {
    static let emojiart = UTType(exportedAs: "mf.p.emojiart")
}

class EmojiArtDocument: ReferenceFileDocument {
    static var readableContentTypes: [UTType] {
        [.emojiart]
    }
    
    required init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            emojiArt = try EmojiArt(json: data)
        } else {
            throw CocoaError(.fileReadCorruptFile)
        }
    }
    
    func snapshot(contentType: UTType) throws -> Data {
        try emojiArt.json()
    }
    
    func fileWrapper(snapshot: Data, configuration: WriteConfiguration) throws -> FileWrapper {
        FileWrapper(regularFileWithContents: snapshot)
    }
    
    
    typealias Emoji = EmojiArt.Emoji
    
    @Published private var emojiArt = EmojiArt() {
        didSet {
//            autosave()
            
            if emojiArt.background != oldValue.background {
                Task {
                    await fetchBackgroundImage()
                }
            }
        }
    }
    
//    private let autosaveURL: URL = URL.documentsDirectory.appendingPathComponent("Autosaved.emojiart")
//    
//    private func autosave() {
//        save(to: autosaveURL)
//    }
//    
//    private func save(to url: URL) {
//        do {
//            let data = try emojiArt.json()
//            try data.write(to: url)
//        } catch let error {
//            // erros is the error thrown
//            print("EmojiArtDocument: error while saving \(error.localizedDescription)")
//        }
//
//    }
    
    init(){
//        if let data =  try? Data(contentsOf: autosaveURL),
//           let autosavedEmojiArt = try? EmojiArt(json: data) {
//            emojiArt = autosavedEmojiArt
//        }
    }
    
    var emojis: [Emoji] {
        emojiArt.emojis
    }
    
    var bbox: CGRect {
        var bbox = CGRect.zero
        for emoji in emojiArt.emojis {
            bbox = bbox.union(emoji.bbox)
        }
        if let backgroundSize = background.uiImage?.size {
            bbox = bbox.union(CGRect(center: .zero, size: backgroundSize))
        }
        return bbox
    }
//    var background: URL? {
//        emojiArt.background
//    }
//    
    @Published var background: Backgroud = .none
    
    // MARK: - Background Image
    @MainActor
    private func fetchBackgroundImage() async {
        if let url = emojiArt.background {
            background = .fetching(url)
            do {
                let image = try await fetchUIImage(from: url)
                if url == emojiArt.background {
                    background = .found(image)
                }
            } catch {
                background = .failed("Couldn't set background: \(error.localizedDescription)")
            }
        } else {
            background = .none
        }
    }
    
    private func fetchUIImage(from url: URL) async throws -> UIImage {
        let (data, _) = try await URLSession.shared.data(from: url)
        if let uiImage = UIImage(data: data) {
            return uiImage
        } else {
            throw FetchError.badImageData
        }
    }
    
    enum FetchError: Error {
        case badImageData
    }
    
    enum Backgroud {
        case none
        case fetching(URL)
        case found(UIImage)
        case failed(String)
        
        var uiImage: UIImage?{
            switch self {
            case .found(let uiImage): return uiImage
            default: return nil
            }
        }

        var urlBeingFetched : URL?{
            switch self {
            case .fetching(let url): return url
            default: return nil
            }
        }
        
        var isFetching: Bool { urlBeingFetched != nil }
        
        var failureReason : String?{
            switch self {
            case .failed(let errorMessage): return errorMessage
            default: return nil
            }
        }
    }
    
    // MARK: - Intents
    private func undoablyPerform(_ action: String, with undoManager: UndoManager? = nil, doit: () -> Void) {
        let oldEmojiArt = emojiArt
        doit()
        undoManager?.registerUndo(withTarget: self, handler: { myself in
            myself.undoablyPerform(action, with: undoManager) { //<---- redo
                myself.emojiArt = oldEmojiArt
            }
        })
    }
    
    
    func setBackground(_ url: URL?, undoManager: UndoManager? = nil) {
        undoablyPerform("Set Background", with: undoManager){
            emojiArt.background = url
        }
    }
    
    func addEmoji(_ emoji: String, at position: Emoji.Position, size: CGFloat, undoManager: UndoManager? = nil) {
        undoablyPerform("Add \(emoji)", with: undoManager){
            emojiArt.addEmoji(emoji, at: position, size: Int(size))
        }
    }

}


extension EmojiArt.Emoji {
    var font: Font {
        Font.system(size: CGFloat(size))
    }
    var bbox: CGRect {
        CGRect (
            center: position.in(nil),
            size: CGSize(width: CGFloat(size), height: CGFloat(size)))
    }
}

extension EmojiArt.Emoji.Position {
    func `in`(_ geometry: GeometryProxy?) -> CGPoint {
        let center = geometry?.frame(in: .local).center ?? .zero
        return CGPoint(
            x: center.x + CGFloat(x),
            y: center.y - CGFloat(y))
    }
}
