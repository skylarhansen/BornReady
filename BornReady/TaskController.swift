//
//  TaskController.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/11/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import Foundation

class TaskController {
    
    static let sharedController = TaskController()
    
    func isCompleteValueToggled(task: Task) {
        task.isComplete = !task.isComplete.boolValue
        saveContext()
    }
    
    func saveContext() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Unable to save to persistent store. Error: \(error)")
        }
    }
}