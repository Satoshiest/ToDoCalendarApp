//
//  NewTaskButton.swift
//  ToDoCalendarApp
//
//  Created by Satoshi Kameyama on 2023-08-21.
//

import SwiftUI

struct NewTaskButton: View {
    var body: some View {
        HStack {
            Image(systemName: "plus.circle")
                .bold()
            Text("New Task")
                .fontWeight(.bold)
        }
        .padding(15)
        .foregroundColor(.white)
        .background(Color.accentColor)
        .cornerRadius(30)
        .padding(30)
        .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
    }
}

struct NewTaskButton_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskButton()
    }
}
