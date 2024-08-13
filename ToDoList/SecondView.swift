//
//  SecondView.swift
//  ToDoList
//
//  Created by Can Dindar on 2024-08-19.
//

import SwiftUI

struct SecondView: View {
    @Binding var task: String
    @Binding var tasks: [TaskItem]
    @Binding var showSheet: Bool
    @Binding var selectedPriority: TaskPriority
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.white)
                    .ignoresSafeArea()
                VStack {
                    TextField("New Task", text: $task)
                        .foregroundColor(.black)
                        .padding(10)
                        .background(Color.gray.opacity(0.5).cornerRadius(15))
                        .padding(20)
                    
                    HStack {
                        ForEach(TaskPriority.allCases, id: \.self) { priority in
                            Button(action: {
                                self.selectedPriority = priority
                            }, label: {
                                Text(priority.rawValue)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 10)
                                    .foregroundColor(.white)
                                    .bold()
                                    .background(selectedPriority == priority ? priority.color : Color.gray.opacity(0.5))
                                    .cornerRadius(15)
                            })
                        }
                    }
                    Spacer()
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button(action: {
                            addTask()
                        }, label: {
                            Text("Save")
                                .padding(.horizontal, 140)
                                .padding(.vertical, 10)
                                .foregroundColor(.white)
                                .bold()
                                .background(Color.indigo.cornerRadius(15))
                        })
                    }
                    ToolbarItem {
                        Button(action: {
                            showSheet = false
                        }, label: {
                            Image(systemName: "xmark")
                                .padding(.horizontal, 10)
                                .padding(.vertical, 10)
                                .foregroundColor(.white)
                                .background(Color.indigo.cornerRadius(40))
                        })
                    }
                }
            }
            .navigationTitle("New Task")
        }
    }
    
    func addTask() {
        if !task.isEmpty {
            tasks.append(TaskItem(name: task, priority: selectedPriority))
            task = ""
            showSheet = false
        }
    }
}

// Preview for testing the UI
struct SecondView_Previews: PreviewProvider {
    @State static var task: String = ""
    @State static var selectedPriority: TaskPriority = .normal
    @State static var tasks: [TaskItem] = []
    @State static var showSheet: Bool = true
    
    static var previews: some View {
        SecondView(task: $task, tasks: $tasks, showSheet: $showSheet, selectedPriority: $selectedPriority)
    }
}
