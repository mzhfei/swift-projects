//
//  SettingsView.swift
//  Fructus
//
//  Created by Mengzhe Fei on 2023-12-10.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 20, content: {
                    // MARK: section 1
                    GroupBox {
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: .center, content: {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text("Most fruits are naturally low in fat, sodium and calories. None have choleserol. Fruits are sources of many essenstial nutrients, including potassiu,, dietary fiber, vitamins and much more")
                                .font(.footnote)
                        })
                        
                    } label: {
                        SettingsLabelView(
                            labelText: "Fructus",
                            labelImage: "info.circle")
                    }

                    
                    // MARK: section 2
                    GroupBox {
                        Divider().padding(.vertical, 4)
                        
                        Text("If you wish, you can restart the application by toggle the switch in this box. that way, it starts the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical,8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $isOnboarding) {
                            if isOnboarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    } label: {
                        SettingsLabelView(labelText: "Customization", labelImage:"paintbrush")
                    }

                    
                    // MARK: section 3
                    GroupBox {
                        SettingsRowView(title: "Developer", content: "MZHFEI")
                        SettingsRowView(title: "Designer", content: "MZHFEI")
                        SettingsRowView(title: "Compatibility", content: "iOS 17")
                        SettingsRowView(title: "Website", linkLabel: "mfei", linkDestination:"www.google.ca")
                        SettingsRowView(title: "X", linkLabel: "@mfei", linkDestination:"www.google.ca")
                        SettingsRowView(title: "SwiftUI", content: "2.0")
                        SettingsRowView(title: "Version", content: "1.0")


                    } label: {
                        SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                    }

                    
                    
                })// Vstack
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "xmark")
                        }))
                .padding()
            }//Scroll view
        }// nav view
    }
}

#Preview {
    SettingsView()
}
