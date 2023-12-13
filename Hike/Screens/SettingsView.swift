//
//  SettingsView.swift
//  Hike
//
//  Created by Mengzhe Fei on 2023-12-01.
//

import SwiftUI

struct SettingsView: View {
    // MARK: -PROPERTIES
    
    private let alternateAppIcons: [String] = [
      "AppIcon-MagnifyingGlass",
      "AppIcon-Map",
      "AppIcon-Mushroom",
      "AppIcon-Camera",
      "AppIcon-Backpack",
      "AppIcon-Campfire"
    ]
    
    var body: some View {
        List{
            //MARK: headers
            Section{
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading").font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike").font(.system(size: 66, weight: .black))
                        Text("Editor's Choice").font(.system(size: 20, weight: .black))
                    }
                    
                    Image(systemName: "laurel.trailing").font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(LinearGradient(
                    colors: [.customGreenLight, .customGreenMedium, .customGreenDark],
                    startPoint: .top,
                    endPoint: .bottom))
                .padding(.top, 8)
                
                VStack(spacing: 8){
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots! Let's go for a walk!")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            } //: header
            .listRowSeparator(.hidden)
            //MARK: content
            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id:\.self) { item in
                            CustomIconButton(iconName: alternateAppIcons[item])
                        }
                    }
                }//: SCROLL VIEw
                .padding(.top, 12)
                Text("Choose your favourite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.top, 12)
            }
            .listRowSeparator(.hidden)
            //MARK: about

            Section(
                header: Text("ABOUT THE APP"),
                footer:
                    HStack{
                        Spacer()
                        Text("COPYRIGHT ALL RIGHT RESERVED")
                        Spacer()
                    }
                    .padding(.vertical, 8)
            ){
                // 1. basic labled content
                //  LabeledContent("Application", value: "Hike")
                // 2. advanced labled content
                CustomListRowView(
                    rowLable: "Application",
                    rowIcon: "apps.iphone",
                    rowContent: "Hike",
                    rowTintColor: .blue) 
                CustomListRowView(
                    rowLable: "Compatibility",
                    rowIcon: "info.circle",
                    rowContent: "iOS, iPadOs",
                    rowTintColor: .red)
                CustomListRowView(
                    rowLable: "Technology",
                    rowIcon: "swift",
                    rowContent: "Swift",
                    rowTintColor: .orange)
                CustomListRowView(
                    rowLable: "Version",
                    rowIcon: "gear",
                    rowContent: "1.0",
                    rowTintColor: .purple)
                CustomListRowView(
                    rowLable: "Developer",
                    rowIcon: "ellipsis.curlybraces",
                    rowContent: "MZHFEI",
                    rowTintColor: .cyan)
                CustomListRowView(
                    rowLable: "Email",
                    rowIcon: "recordingtape",
                    rowTintColor: .indigo,
                    rowLinkLabel: "Email Me",
                    rowLinkDestination: "mailto: mzhfei@outlook.com")
                CustomListRowView(
                    rowLable: "Website",
                    rowIcon: "globe",
                    rowTintColor: .mint,
                    rowLinkLabel: "MyWebsite",
                    rowLinkDestination: "https://www.google.com")
            }//:ABOUT SECTION END
        }
    }
}

#Preview {
    SettingsView()
}
