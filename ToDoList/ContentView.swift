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
                    .onDelete(perform: { indexSet in
                        
                    })
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

#Preview {
    ContentView()
}
