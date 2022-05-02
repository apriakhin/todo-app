//
//  TaskView.swift
//  Todo
//
//  Created by Anton Priakhin on 30.04.2022.
//

import SwiftUI

struct TaskView: View {
    @Environment(\.managedObjectContext) var moc
    
    @StateObject var task: Task
    
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
                onTaskTapped()
            }
            
            Text(task.title)
                .fontWeight(task.isImportant ? .bold : .regular)
        }
    }
    
    private func onTaskTapped() {
        task.isDone.toggle()
        try? moc.save()
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(task: Task())
    }
}
