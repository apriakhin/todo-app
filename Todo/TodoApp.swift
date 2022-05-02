//
//  TodoApp.swift
//  Todo
//
//  Created by Anton Priakhin on 22.04.2022.
//

import SwiftUI

@main
struct TodoApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
