//
//  CheckBoxView.swift
//  ToDoCalendarApp
//
//  Created by Satoshi Kameyama on 2023-08-25.
//

import SwiftUI

struct CheckBoxView: View {
    @ObservedObject var task: TaskItem
    var body: some View {
        Image(systemName: task.is_completed ? "checkmark.circle.fill" : "circle")
            .foregroundColor(task.is_completed ? .green : .secondary)
            .onTapGesture {
                withAnimation {
                    task.is_completed.toggle()
                }
            }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView(task: TaskItem(context: PersistenceController.shared.container.viewContext))
    }
}
