//
//  TaskController.swift
//  ToDoCalendarApp
//
//  Created by Satoshi Kameyama on 2023-08-20.
//

import Foundation
import CoreData

class TaskController: ObservableObject {
    
    //  Create and Setup Core Data Stack
    let container = NSPersistentContainer(name: "TaskModel")
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func saveTask(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Saved Successfully!!")
        } catch {
            print("Error Occured!!")
        }
    }
    
    func addTask(title: String, notes: String, due_date: Date, is_completed: Bool, is_scheduled: Bool, context: NSManagedObjectContext) {
        let newTask = TaskItem(context: context)
        newTask.id = UUID()
        
        newTask.title = title
        newTask.notes = notes
        
        newTask.due_date = due_date
        newTask.is_completed = false
        
        newTask.is_scheduled = false
        
        saveTask(context: context)
    }
    
    func editTask(task: TaskItem, title: String, notes: String, due_date: Date, context: NSManagedObjectContext) {
        task.title = title
        task.notes = notes
        task.due_date = due_date
        saveTask(context: context)
    }
    
    func completeTask(task: TaskItem, context: NSManagedObjectContext) {
        task.is_completed = true
        saveTask(context: context)
    }
}
