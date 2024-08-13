////
////  PracticeView.swift
////  ToDoList
////
////  Created by Can Dindar on 2024-08-17.
////
//
//import SwiftUI
//
//struct PracticeView: View {
//    
//    @State var task: String = ""
//    @State var tasks: [String] = [""]
//    @FocusState  var isFocused: Bool // State to manage focus
//    @State var showSheet: Bool = false
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                List {
//                    ForEach(tasks, id: \.self) { task in Text(task)
//                    }
//                }
//                .toolbar {
//                    ToolbarItem {
//                        Button(action: {
//                            showSheet.toggle()
//                            
//                            addTask()
//                        }, label: {
//                            Image(systemName: "plus")
//                                .padding(10)
//                                .foregroundColor(.white)
//                                .bold()
//                                .background (Color.red.cornerRadius (50))
//                        })
//                        .padding()
//                    }
//                }
//            }
//            .sheet(isPresented: $showSheet, content: {
//                SecondView(task: $task, tasks: $tasks, showSheet: false)
//                //                SecondView(task: $task, tasks: $tasks, showSheet: $showSheet) // Pass the binding
//                //                TextField("", text: $task)
//                //                   .textFieldStyle(RoundedBorderTextFieldStyle())
//                
//            })
//            .navigationTitle("Agenda")
//        }
//        
//    }
//    func addTask() {
//        tasks.append(task)
//        task = ""
//    }
//}
//// MARK: ------------------
//
//
//import SwiftUI
//
//struct SecondView: View {
//    @Binding var task: String
//    @Binding var tasks: [String]
//    @State var showSheet: Bool
//    
//    
//    var body: some View {
//        NavigationStack {
//            //            TextField("add task", $task)
//            ZStack {
//                Color(.white)
//                    .ignoresSafeArea()
//                VStack {
//                    // Add your views here inside the VStack
//                    TextField("New Task", text: $task)
//                        .foregroundColor(.black)
//                        .padding(10)
//                        .background(Color.gray.opacity(0.5))
//                        .padding(10)
//                    
//                    
//                        .toolbar() {
//                            ToolbarItem(placement: .bottomBar) {
//                                Button(action: {
//                                    
//                                    // Action for the button
//                                }, label: {
//                                    Text("Save")
//                                        .padding(.horizontal, 140)
//                                        .padding(.vertical, 10)
//                                        .foregroundColor(.white)
//                                        .bold()
//                                        .background(Color.indigo.cornerRadius(15))
//                                })
//                            }
//                            ToolbarItem {
//                                
//                                Button(action: {
//                                    
//                                    // Action for the button
//                                }, label: {
//                                    Image(systemName: "xmark")
//                                        .padding(.horizontal, 10)
//                                        .padding(.vertical, 10)
//                                        .foregroundColor(.white)
//                                    //                                    .bold()
//                                        .background(Color.indigo.cornerRadius(40))
//                                    
//                                })
//                            }
//                            
//                        }
//                    
//                }
//                
//            }
//            .navigationTitle("New Task")
//            
//            
//        }
//    }
//}
//
//
//#Preview {
//    PracticeView()
//}
////#Preview {
////    SecondView()
////}
