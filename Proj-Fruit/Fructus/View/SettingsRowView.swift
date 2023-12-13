//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Mengzhe Fei on 2023-12-10.
//

import SwiftUI

struct SettingsRowView: View {
    var title: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack{
                Text(title).foregroundStyle(Color.gray)
                Spacer()
                if content != nil {
                    Text(content!)
                } else if( linkLabel != nil && linkDestination != nil){
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!
                         )
                    Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
                }else {
                    EmptyView()
                }
                
            }
        }
    }
}

#Preview {
    Group{
        SettingsRowView(title: "Link", linkLabel: "link", linkDestination: "www.bing.com")
        SettingsRowView(title: "Developer", content: "MZHFEI")

    }
        
}


