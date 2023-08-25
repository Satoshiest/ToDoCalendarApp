//
//  Persistence.swift
//  For Preview purpose only
//
//  Created by Satoshi Kameyama on 2023-08-25.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        //  Create 5 example tasks 
        for index in 1...5 {
            let newTaskItem = TaskItem(context: viewContext)
            newTaskItem.id = UUID()
            newTaskItem.title = "Test Task \(index)"
            newTaskItem.notes = "This is a test task."
            newTaskItem.is_completed = false
            newTaskItem.due_date = Date()
            newTaskItem.is_scheduled = true
        }
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    
    //  Create and Setup Core Data Stack
    let container: NSPersistentContainer
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "TaskModel")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
