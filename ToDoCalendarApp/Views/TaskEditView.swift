//
//  TaskEditView.swift
//  ToDoCalendarApp
//
//  Created by Satoshi Kameyama on 2023-08-20.
//

import SwiftUI

struct TaskEditView: View {
    @Environment (\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State var selectedTaskItem: TaskItem?
    @State var title = ""
    @State var notes = ""
    
    @State var is_completed = false
    @State var is_scheduled = false
    
    @State var due_date = Date()
    
    
    var body: some View {
        Form {
            Section(header: Text("Task")) {
                TextField("Title", text: $title)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .font(.headline)
                
                TextField("Description", text: $notes)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .font(.headline)
            }
            Section(header: Text("Due Date")){
                Toggle("Schedule Time", isOn: $is_scheduled)
                DatePicker("Due Date", selection: $due_date, displayedComponents: is_scheduled ? [.hourAndMinute, .date] : [.date])
            }
            Section{
                Button("Save") {
                    TaskController().addTask(title: title, notes: notes, due_date: due_date, is_completed: is_completed, is_scheduled: is_scheduled, context: managedObjContext)
                    dismiss()
                }
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

struct TaskEditView_Previews: PreviewProvider {
    static var previews: some View {
        TaskEditView()
    }
}
