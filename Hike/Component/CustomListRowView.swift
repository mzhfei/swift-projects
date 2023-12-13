//
//  CustomListRowView.swift
//  Hike
//
//  Created by Mengzhe Fei on 2023-12-01.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: properties
    @State var rowLable: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent{
            // Content
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            }else if (rowLinkLabel != nil && rowLinkDestination != nil){
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
            } label: {
            // Label
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width:30, height:30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLable)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(rowLable: "Website", rowIcon: "globe", rowContent: nil, rowTintColor: .pink, rowLinkLabel: "My website", rowLinkDestination: "google.com")
    }
}
