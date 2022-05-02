//
//  Task.swift
//  Todo
//
//  Created by Anton Priakhin on 30.04.2022.
//

import CoreData
import SwiftUI

@objc(Task)
class Task: NSManagedObject {
    @NSManaged var uuid: UUID
    @NSManaged var title: String
    @NSManaged var date: Date
    @NSManaged var isImportant: Bool
    @NSManaged var isDone: Bool
}

extension Task: Identifiable {
    var id: UUID {
        uuid
    }
}
