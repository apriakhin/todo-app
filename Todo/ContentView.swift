//
//  ContentView.swift
//  Todo
//
//  Created by Anton Priakhin on 22.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var date = Date.now
    @State private var tasks = [
        Task(title: "Create app", date: .now, isImportant: true, isDone: false),
        Task(title: "Add data model", date: .now, isImportant: false, isDone: false),
        Task(title: "Create context", date: .now, isImportant: false, isDone: false),
    ]
    
    @State private var isShowSelectDate = false
    @State private var isShowCreateTask = false
    
    var body: some View {
        NavigationView {
            TaskListView(tasks: tasksForDate) { id in
                onTaskTapped(by: id)
            }
            .toolbar {
                ToolbarItemGroup(placement: .cancellationAction) {
                    Button(action: { isShowSelectDate = true }) {
                        Image(systemName: "calendar")
                    }
                }
                
                ToolbarItemGroup(placement: .primaryAction) {
                    Button(action: { isShowCreateTask = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowSelectDate) {
                SelectDateView(date: $date)
            }
            .sheet(isPresented: $isShowCreateTask) {
                CreateTaskView(onTaskSaved: { task in
                    tasks.append(task)
                })
            }
            .navigationTitle(title)
        }
    }
    
    private func onTaskTapped(by id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isDone.toggle()
        }
    }
    
    private var title: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.doesRelativeDateFormatting = true

        return dateFormatter.string(from: date)
    }
    
    private var tasksForDate: [Task] {
        tasks.filter {
            Calendar.current.compare($0.date, to: date, toGranularity: .day) == .orderedSame
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
