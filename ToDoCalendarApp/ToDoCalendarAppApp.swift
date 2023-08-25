//
//  ToDoCalendarAppApp.swift
//  ToDoCalendarApp
//
//  Created by Satoshi Kameyama on 2023-08-20.
//

import SwiftUI

@main
struct ToDoCalendarAppApp: App {
    @StateObject private var taskController = TaskController()
    
    var body: some Scene {
        WindowGroup {
            TaskListView()
                .environment(\.managedObjectContext, taskController.container.viewContext)
        }
    }
}
