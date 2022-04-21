//
//  ContentView.swift
//  Todo
//
//  Created by Anton Priakhin on 22.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks = [
        (id: 0, isChecked: false, title: "Create app"),
        (id: 1, isChecked: false, title: "Add data model"),
        (id: 2, isChecked: false, title: "Create context")
    ]
    
    @State private var showindAddTask = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tasks, id: \.id) { item in
                    HStack {
                        if item.isChecked {
                            Image(systemName: "checkmark.square.fill")
                                .foregroundColor(.accentColor)
                            
                            Text(item.title)
                                .strikethrough()

                        } else {
                            Image(systemName: "square.fill")
                                .foregroundColor(.accentColor)
                            
                            Text(item.title)
                        }
                    }
                    .onTapGesture { onTap(by: item.id) }
                }
            }
            .navigationTitle("Today")
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    Button(action: {
                        showindAddTask = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showindAddTask) {
                AddTaskView(addNewTask: { title in
                    tasks.append((
                        id: (tasks.last?.id ?? 0) + 1,
                        isChecked: false,
                        title: title
                    ))
                })
            }
        }
    }
    
    private func onTap(by id: Int) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isChecked.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
