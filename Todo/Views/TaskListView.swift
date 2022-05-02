//
//  TaskListView.swift
//  Todo
//
//  Created by Anton Priakhin on 30.04.2022.
//

import SwiftUI

struct TaskListView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest var tasks: FetchedResults<Task>
    
    init(date: Date) {
        _tasks = FetchRequest<Task>(
            sortDescriptors: [SortDescriptor(\.isImportant, order: .reverse)],
            predicate: date.makeDatePredicate()
        )
    }
    
    var body: some View {
        if tasks.isEmpty {
            EmptyView(text: "There are no tasks for this day")
        } else {
            List {
                ForEach(tasks) { task in
                    TaskView(task: task)
                }
                .onDelete(perform: deleteTasks)
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    
    func deleteTasks(at offsets: IndexSet) {
        for offset in offsets {
            let task = tasks[offset]

            moc.delete(task)
        }

        try? moc.save()
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(date: .now)
    }
}

private extension Date {
    func makeDatePredicate() -> NSPredicate {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
        components.hour = 00
        components.minute = 00
        components.second = 00
        let startDate = calendar.date(from: components)
        components.hour = 23
        components.minute = 59
        components.second = 59
        let endDate = calendar.date(from: components)
        return NSPredicate(format: "date >= %@ AND date =< %@", argumentArray: [startDate!, endDate!])
    }
}
