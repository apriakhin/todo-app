//
//  DataController.swift
//  Todo
//
//  Created by Anton Priakhin on 02.05.2022.
//

import CoreData

class DataController: ObservableObject {
    let container: NSPersistentContainer
    
    init() {
        let taskEntity = NSEntityDescription()
        taskEntity.name = "Task"
        taskEntity.managedObjectClassName = "Task"
        
        let uuidAttribute = NSAttributeDescription()
        uuidAttribute.name = "uuid"
        uuidAttribute.type = .uuid
        taskEntity.properties.append(uuidAttribute)
        
        let nameAttribute = NSAttributeDescription()
        nameAttribute.name = "title"
        nameAttribute.type = .string
        taskEntity.properties.append(nameAttribute)
        
        let dateAttribute = NSAttributeDescription()
        dateAttribute.name = "date"
        dateAttribute.type = .date
        taskEntity.properties.append(dateAttribute)
        
        let isImportantAttribute = NSAttributeDescription()
        isImportantAttribute.name = "isImportant"
        isImportantAttribute.type = .boolean
        taskEntity.properties.append(isImportantAttribute)
        
        let isDoneAttribute = NSAttributeDescription()
        isDoneAttribute.name = "isDone"
        isDoneAttribute.type = .boolean
        taskEntity.properties.append(isDoneAttribute)
        
        let todoModel = NSManagedObjectModel()
        todoModel.entities = [taskEntity]
        
        container = NSPersistentContainer(name: "TodoModel", managedObjectModel: todoModel)
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
