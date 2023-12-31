//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Mengzhe Fei on 2023-12-20.
//

import SwiftUI

struct NewTaskItemView: View {
    // MARK: - property
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @Environment(\.managedObjectContext) private var viewContext
    @State private var task: String = ""
    @Binding var isShowing: Bool

    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    // MARK: - func
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            task = ""
            hideKeyboard()
            isShowing = false
        }
    }
    
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16, content: {
                TextField("New Task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(
                        isDarkMode ?
                        Color(UIColor.tertiarySystemBackground) :
                        Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button {
                    addItem()
                    playSound(sound: "sound-ding", type: "mp3")
                    feedback.notificationOccurred(.success)
                } label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 24, weight: .bold, design: .rounded))

                    Spacer()
                }
                .disabled(isButtonDisabled)
                .onTapGesture {
                    if isButtonDisabled {
                        playSound(sound: "sound-tap", type: "mp3")
                    }
                }
                .padding()
                .foregroundStyle(.white)
                .background(isButtonDisabled ? Color.gray : Color.pink)
                .cornerRadius(10)
                
            })// VSTACK
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(
                isDarkMode ?
                Color(UIColor.secondarySystemBackground) : .white
            )
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)
        }
        .padding()
    }
}


#Preview {
    NewTaskItemView(isShowing: .constant(true))
}
