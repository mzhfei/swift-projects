//
//  SourceLinkView.swift
//  Fructus
//
//  Created by Mengzhe Fei on 2023-12-09.
//

import SwiftUI

struct SourceLinkView: View {
    var fruitName: String
    var body: some View {
        GroupBox() {
            HStack{
                Text("Content source")
                Spacer()
                Link(destination: URL(string:"https://wikipedia.com/\(fruitName)")!){
                    Text("Wiki")
                    Image(systemName: "arrow.up.right.square")
                }
            }
        }
    }
}

#Preview {
    SourceLinkView(fruitName: "pear")
        .previewLayout(.sizeThatFits)
        .padding()
}
