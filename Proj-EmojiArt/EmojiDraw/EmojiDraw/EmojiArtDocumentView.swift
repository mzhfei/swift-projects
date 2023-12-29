//
//  EmojiArtDocumentView.swift
//  EmojiDraw
//
//  Created by Mengzhe Fei on 2023-12-25.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    typealias Emoji = EmojiArt.Emoji
    @ObservedObject var document: EmojiArtDocument
    
    
    private let emojis = "🍏🍎🍐🍊🍋🫐🍓🍇🍉🍌🍈🍒🍑🥭🍍🥑🍆🍅🥝🥥🫛🥦🥬🥒🌶️🫒🧄🥕🌽🫑🧅🍠🫚🥐🧀🥨🥖🍞🥯🥚🍳🧈🧈🧇🦴🍖🍗🥩🥓🌭🍔🍟🍕🫓🌯🌮🧆🥙🥪🫔🥗🥘🫕🥫🍝🍜🍲🍛🍤🦪🥟🍱🍣🍙🍚🍘🍥🥠🍨🍧🍡🍢🥮🍦🥧🧁🍰🎂🍿🍫🍬🍭🍮🍪🍩🌰🥜🫘"
    private let paletteEmojiSize: CGFloat = 40
    var body: some View {
        VStack (spacing: 0) {
            documentBody
            
            PaletteChooserView()
                .font(.system(size: paletteEmojiSize))
                .padding(.horizontal)
                .scrollIndicators(.hidden)
        } //: Vstack
        

    }
    
    private var documentBody: some View {
        GeometryReader { geometry in
            ZStack {
                Color.white
                documentContents(in: geometry)
                    .scaleEffect(zoom * gestureZoom)
                    .offset(pan + gesturePan)
            }//: Zstack
            .gesture(panGesture.simultaneously(with: zoomGesture))
            .dropDestination(for: Sturldata.self) { sturldatas, location in
                drop(sturldatas, at: location, in: geometry)

            }
        }
    }

    @State private var zoom: CGFloat = 1
    @State private var pan: CGOffset = .zero
    
    @GestureState private var gestureZoom: CGFloat = 1
    private var zoomGesture: some Gesture {
        MagnificationGesture()
            .updating($gestureZoom) { inMotionPinchScale, gestureZoom, _ in
                gestureZoom = inMotionPinchScale
                
            }
            .onEnded{ value in
                zoom *= value
            }
    }
    
    @GestureState private var gesturePan: CGOffset = .zero
    private var panGesture: some Gesture {
        DragGesture()
            .updating($gesturePan){ value, gesturePan, _ in
                gesturePan = value.translation
            }
            .onEnded { value in
                pan += value.translation
            }
    }
    
    
    @ViewBuilder
    private func documentContents(in geometry: GeometryProxy) -> some View {
        // image
        AsyncImage(url: document.backgrounds) { phase in
            if let image = phase.image {
                image
            } else if let url = document.backgrounds {
                if phase.error != nil {
                    Text("\(url)")
                } else {
                    ProgressView()
                }
            }
        }
            .position(Emoji.Position.zero.in(geometry))

        ForEach(document.emojis) { emoji in
            Text(emoji.string)
                .font(emoji.font)
                .position(emoji.position.in(geometry))
        }
    }
    
    private func drop(_ sturldatas: [Sturldata], at location: CGPoint, in geometry: GeometryProxy) -> Bool {
        for sturldata in sturldatas {
            switch sturldata {
            case .url(let url):
                document.setBackground(url)
                return true
            case .string(let emoji):
                document.addEmoji(
                    emoji,
                    at: emojiPosition(at: location, in: geometry),
                    size: paletteEmojiSize / zoom
                )
                return true

            default:
                break
            }
        }

        return false
    }
    
    private func emojiPosition( at location: CGPoint, in geometry: GeometryProxy) -> Emoji.Position {
        let center = geometry.frame(in: .local).center
        
        return Emoji.Position(
            x: Int((location.x - center.x - pan.width) / zoom),
            y: Int(-(location.y - center.y - pan.height) / zoom)
        )
    }
}


#Preview {
    EmojiArtDocumentView(document: EmojiArtDocument())
        .environmentObject(PaletteStore(named: "preview"))
}


