//
//  TaskListView.swift
//  ToDoCalendarApp
//
//  Created by Satoshi Kameyama on 2023-08-20.
//

import SwiftUI

struct TaskListView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TaskItem.due_date, ascending: true)],
        animation: .default)
    private var tasks: FetchedResults<TaskItem>
    
    @State private var showingBottomSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    List {
                        ForEach(tasks) { task in
                            NavigationLink {
                                Text(task.title!)
                            } label: {
                                Text(task.title!)
                            }
                        }
                        .onDelete(perform: deleteTask)
                    }
                }
                HStack {
                    Spacer()
                    NewTaskButton()
                        .onTapGesture {showingBottomSheet.toggle()}
                }
            }
            .navigationTitle("To Do List")
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingBottomSheet) {
                VStack{
                    HStack {
                        Text("Cancel")
                            .foregroundColor(.accentColor)
                            .onTapGesture {showingBottomSheet.toggle()}
                        Spacer()
                        Text("New Task")
                            .font(.title3)
                            .bold()
                        Spacer()
                        Text("Add")
                            .bold()
                            .foregroundColor(.accentColor)
                    }.padding()
                    
                    TaskEditView()
                }
            }
        }
    }
    
    private func deleteTask(offsets: IndexSet) {
        withAnimation {
            offsets.map { tasks[$0] }.forEach(managedObjContext.delete)
            
            do {
                try managedObjContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
