//
//  ContentView.swift
//  Fructus
//
//  Created by Mengzhe Fei on 2023-12-08.
//

import SwiftUI

struct ContentView: View {
    // MARK: properties
    var fruits: [Fruit] = fruitsData
    @State private var isShowingSettings: Bool = false
    
    
    // MARK: body
    var body: some View {
        NavigationView{
            List {
                ForEach(fruits) { fruit in
                    NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                    }
                  
                }
            }
            .navigationTitle("Fruits")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        isShowingSettings = true
                    }, label: {
                        Image(systemName: "slider.horizontal.3")
                    })//button
                    .sheet(isPresented: $isShowingSettings, content: {
                        SettingsView()
                    })
            )
            
        }//: nav view
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

#Preview {
    ContentView()
}
