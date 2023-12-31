//
//  ContentView.swift
//  Devote
//
//  Created by Mengzhe Fei on 2023-12-19.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - property
    @State var task: String = ""
    @State private var showNewTaskItem: Bool = false
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    // Fetching Data
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    
    // MARK: - function
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    // MARK: - body
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - main view
                VStack(content: {
                    // MARK: - header
                    HStack(spacing: 10, content: {
                        //title
                        Text("Devote")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.heavy)
                            .padding(.leading, 4)
                        
                        Spacer()
                        // edit
                        EditButton()
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .padding(.horizontal, 10)
                            .frame(minWidth:70, minHeight: 24)
                            .background(
                                Capsule().stroke(.white, lineWidth: 2))

                        // appearence
                        Button(action: {
                                isDarkMode.toggle()
                            playSound(sound: "sound-tap", type: "mp3")
                            feedback.notificationOccurred(.success)
                        }, label: {
                            Image(systemName: isDarkMode ? "moon.circle.fill" : "moon.circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .font(.system(.title, design: .rounded))
                            
                        })
                    })
                    .padding()
                    .foregroundStyle(.white)
                
                    
                    Spacer(minLength: 80)
                    
                    // MARK: - new task button
                    Button(action: {
                        playSound(sound: "sound-ding", type: "mp3")
                        feedback.notificationOccurred(.success)
                        withAnimation {
                            showNewTaskItem = true
                        }
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                        Text("New Task")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                    })
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(.blue)
                    .clipShape(Capsule())
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
                    .transition(.move(edge: .bottom))
                    .animation(.easeOut(duration: 0.5))
                    
                    
                    // MARK: - tasks
                    List {
                        ForEach(items) { item in
                            NavigationLink {
                                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                            } label: {
                                VStack {
                                    ListRowItemView(item: item)
                                } // vstack
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }// list
                    .listStyle(InsetGroupedListStyle())
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
                    .padding(.vertical, 0)
                    .frame(maxWidth: 640)
                    .scrollContentBackground(.hidden)
                }) // VSTACK
                .blur(radius: showNewTaskItem ? 8.0 : 0, opaque: false)

                // MARK: - new task item
                if showNewTaskItem {
                    BlankView(
                        backgroundColor: isDarkMode ? .black : .gray,
                        backgroundOpacity: isDarkMode ? 0.3 : 0.5)
                        .onTapGesture {
                            withAnimation {
                                showNewTaskItem = false
                            }
                        }
                    NewTaskItemView(isShowing: $showNewTaskItem)
                }
                
            }// zstack
            .onAppear() {
                UITableView.appearance().backgroundColor = UIColor.clear
            }
            .navigationBarTitle("Daily Task", displayMode: .large)
            .navigationBarHidden(true)
            .background(
                BackgroundImageView()
                    .blur(radius: showNewTaskItem ? 8.0 : 0, opaque: false)
            )
            .background(
                backgroundGradient.ignoresSafeArea(.all)
            )
        }//nav view
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - preview
#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
