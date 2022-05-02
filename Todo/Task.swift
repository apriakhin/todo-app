//
//  Task.swift
//  Todo
//
//  Created by Anton Priakhin on 30.04.2022.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    
    let title: String
    let date: Date
    let isImportant: Bool
    var isDone: Bool
}
