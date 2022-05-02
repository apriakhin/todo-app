//
//  TaskView.swift
//  Todo
//
//  Created by Anton Priakhin on 30.04.2022.
//

import SwiftUI

struct TaskView: View {
    let task: Task
    let onTaskTapped: (UUID) -> Void
    
    var body: some View {
        HStack {
            Group {
                if task.isDone {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.accentColor)

                } else {
                    Image(systemName: "circle")
                        .foregroundColor(.secondary)
                }
            }
            .onTapGesture {
                onTaskTapped(task.id)
            }
            
            Text(task.title)
                .fontWeight(task.isImportant ? .bold : .regular)
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(
            task: Task(title: "Title", date: .now, isImportant: true, isDone: false),
            onTaskTapped: { _ in }
        )
    }
}
