//
//  TaskListView.swift
//  Todo
//
//  Created by Anton Priakhin on 30.04.2022.
//

import SwiftUI

struct TaskListView: View {
    let tasks: [Task]
    let onTaskTapped: (UUID) -> Void
    
    var body: some View {
        if tasks.isEmpty {
            EmptyView(text: "There are no tasks for this day")
        } else {
            List {
                ForEach(tasks) { task in
                    TaskView(
                        task: task,
                        onTaskTapped: onTaskTapped
                    )
                }
            }
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(tasks: [], onTaskTapped: { _ in })
    }
}
