//
//  PaletteChooserView.swift
//  EmojiDraw
//
//  Created by Mengzhe Fei on 2023-12-28.
//

import SwiftUI

struct PaletteChooserView: View {
    @EnvironmentObject var store: PaletteStore
    
    @State private var showPaletteEditor = false
    @State private var showPaletteList = false
    var body: some View {
        HStack {
            chooser
            
            view(for: store.palettes[store.cursorIndex])
        }
        .clipped()
        .sheet(isPresented: $showPaletteEditor, content: {
            PaletteEditor(palette: $store.palettes[store.cursorIndex])
                .font(nil)
        })
        .sheet(isPresented: $showPaletteList, content: {
            NavigationStack {
                EditablePaletteList(store: store)
                    .font(nil)
            }
        })
        
    }
    
    var chooser: some View {
        Button {
            withAnimation {
                store.cursorIndex += 1
            }
        } label: {
            Image(systemName: "paintpalette")
        }
        .contextMenu(ContextMenu(menuItems: {
            gotoMenu
            AnimatedActionButton("New", systemImage: "plus") {
                store.insert(Palette(name: "", emojis: ""))
                showPaletteEditor = true
                
            }
            AnimatedActionButton("Remove", systemImage: "minus.circle", role: .destructive) {
                store.palettes.remove(at: store.cursorIndex)
            }
            AnimatedActionButton("Edit", systemImage: "pencil") {
                showPaletteEditor = true
                
            }

            AnimatedActionButton("List", systemImage: "list.bullet.rectangle.portrait") {
                showPaletteList = true
                
            }
        }))
    }
    
    private var gotoMenu: some View {
        Menu {
            ForEach(store.palettes) { palette in
                AnimatedActionButton(palette.name) {
                    if let index = store.palettes.firstIndex(where: { $0.id == palette.id}) {
                        store.cursorIndex = index
                    }
                }
            }
        } label: {
            Label("Go To", systemImage: "text.insert")
        }
    }
    
    func view(for palette: Palette) -> some View {
        HStack {
            Text(palette.name)
            ScrollingEmojis(palette.emojis)
        }
        .id(palette.id)
        .transition(.asymmetric(
            insertion: .move(edge: .bottom),
            removal: .move(edge: .top)))
    }
    
    
}



struct ScrollingEmojis: View {
    let emojis: [String]
    
    init(_ emojis: String) {
        self.emojis = emojis.uniqued.map(String.init)
    }
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(emojis, id:\.self) { emoji in
                    Text(emoji)
                        .draggable(emoji)
                }
            }
        }
    }
}


struct PaletteEditor_Previews: PreviewProvider {
    struct Preview: View {
        @State private var palette = PaletteStore(named: "Preiview").palettes.first!
        var body: some View {
            PaletteEditor(palette: $palette)
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
