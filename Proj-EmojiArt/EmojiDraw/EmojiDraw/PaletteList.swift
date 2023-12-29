//
//  PaletteList.swift
//  EmojiDraw
//
//  Created by Mengzhe Fei on 2023-12-28.
//

import SwiftUI

struct PaletteList: View {
    @ObservedObject var store: PaletteStore
    
    var body: some View {
        NavigationStack{
            List (store.palettes) { palette in
                NavigationLink(value: palette) {
                    Text(palette.name)
                }
            }
            .navigationDestination(for: Palette.self) { palette in
                PaletteView(palette: palette)
            }
            .navigationTitle("\(store.name) Palettes")
        }
    }
}

struct EditablePaletteList: View {
    @ObservedObject var store: PaletteStore
    @State private var showCursorPalette = false
    
    var body: some View {
            List{
                ForEach(store.palettes) { palette in
                    NavigationLink(value: palette.id) {
                        VStack(alignment: .leading, content: {
                            Text(palette.name)
                            Text(palette.emojis).lineLimit(1)
                        })
                    }
                }
                .onDelete(perform: { indexSet in
                    withAnimation {
                        store.palettes.remove(atOffsets: indexSet)
                    }
                })
                .onMove(perform: { indexSet, newOffset in
                    store.palettes.move(fromOffsets: indexSet, toOffset: newOffset)
                })
            }
            .navigationDestination(for: Palette.ID.self) { paletteId in
                if let index = store.palettes.firstIndex(where: {$0.id == paletteId}) {
                    PaletteEditor(palette: $store.palettes[index])
                }
            }
            .navigationDestination(isPresented: $showCursorPalette, destination: {
                PaletteEditor(palette: $store.palettes[store.cursorIndex])

            })
            .navigationTitle("\(store.name) Palettes")
            .toolbar {
                Button {
                    store.insert(Palette(name: "", emojis: ""))
                    showCursorPalette = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
}

struct PaletteView: View {
    let palette: Palette
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))], content: {
                ForEach(palette.emojis.uniqued.map(String.init), id: \.self) { emoji in
                    NavigationLink(value: emoji) {
                        Text(emoji)

                    }
                }
            })
            .navigationDestination(for: String.self) { emoji in
                Text(emoji).font(.system(size: 300))
            }
            Spacer()
        }
        .padding()
        .font(.largeTitle)
        .navigationTitle(palette.name)
    }
}


