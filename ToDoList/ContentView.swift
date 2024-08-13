import SwiftUI

// TaskPriority enum with CaseIterable conformance
enum TaskPriority: String, CaseIterable {
    case low = "Low"
    case normal = "Normal"
    case high = "High"
    
    var color: Color {
        switch self {
        case .low: return Color.green
        case .normal: return Color.orange
        case .high: return Color.red
        }
    }
}

// TaskItem struct to represent individual tasks
struct TaskItem: Identifiable {
    let id = UUID() // Unique identifier
    var name: String
    var isCompleted: Bool = false
    var priority: TaskPriority = .normal
}

// ContentView displaying the list of tasks
struct ContentView: View {
    @State var selectedPriority: TaskPriority = .normal
    @State var task: String = ""
    @State var tasks: [TaskItem] = [] // Updated to use TaskItem
    @State var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(tasks) { task in
                        HStack {
                            Text(task.name)
                            Spacer()
                            Circle()
                                .fill(task.priority.color)
                                .frame(width: 10, height: 10)
                        }
                    }
                }
                
                .toolbar {
                    ToolbarItem {
                        Button(action: {
                            showSheet.toggle()
                        }, label: {
                            Image(systemName: "plus")
                                .padding(10)
                                .foregroundColor(.white)
                                .bold()
                                .background(Color.red.cornerRadius(50))
                        })
                        .padding()
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                SecondView(task: $task, tasks: $tasks, showSheet: $showSheet, selectedPriority: $selectedPriority)
            }
            .navigationTitle("Agenda")
        }
    }
}

// MARK: ------------------


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
//        }
//    }
//}


#Preview {
    ContentView()
}
