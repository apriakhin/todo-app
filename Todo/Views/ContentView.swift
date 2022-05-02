//
//  ContentView.swift
//  Todo
//
//  Created by Anton Priakhin on 22.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var date = Date.now
    
    @State private var isShowSelectDate = false
    @State private var isShowCreateTask = false
    
    var body: some View {
        NavigationView {
            TaskListView(date: date)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button(action: { isShowSelectDate = true }) {
                            Image(systemName: "calendar")
                        }
                    }
                    
                    ToolbarItemGroup(placement: .bottomBar) {
                        Spacer()
                        
                        Button(action: { isShowCreateTask = true }) {
                            Image(systemName: "square.and.pencil")
                        }
                    }
                }
                .sheet(isPresented: $isShowSelectDate) {
                    SelectDateView(date: $date)
                }
                .sheet(isPresented: $isShowCreateTask) {
                    CreateTaskView()
                }
                .navigationTitle(title)
        }
    }
    
    private var title: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.doesRelativeDateFormatting = true

        return dateFormatter.string(from: date)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
