//
//  TaskCell.swift
//  ToDoCalendarApp
//
//  Created by Satoshi Kameyama on 2023-08-25.
//

import SwiftUI

struct TaskCell: View {
    @ObservedObject var task: TaskItem
    var body: some View {
        HStack {
            CheckBoxView(task: task)
            Text(task.title ?? "")
                .padding(.horizontal)
            Text(verbatim: "\(task.is_completed)")
        }
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: TaskItem(context: PersistenceController.shared.container.viewContext))
    }
}
