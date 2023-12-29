//
//  PaletteMangeView.swift
//  EmojiDraw
//
//  Created by Mengzhe Fei on 2023-12-28.
//

import SwiftUI

struct PaletteManger: View {
    let stores: [PaletteStore]
    @State private var selectedStore: PaletteStore?
    
    
    var body: some View {
        NavigationSplitView {
            List(stores, selection: $selectedStore) { store in
                Text(store.name)
                    .tag(store)
            }
        } content: {
            if let  selectedStore {
                EditablePaletteList(store: selectedStore)
            }
            Text("Choose a store")
        } detail: {
            Text("Choose a palette")

        }
    }
}

//#Preview {
//    PaletteMangeView()
//}
