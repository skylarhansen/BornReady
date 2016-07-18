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
    
    func serializeJSON(completion: (success: Bool) -> Void) {
        let filePath = "/Users/skylarhansen/Documents/DevMountain/CodeBank/Unit6/BornReadyJSON/BornReady.json"
        
        guard let data = NSData(contentsOfFile: filePath),
            serializedData = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments),
            jsonDictionary = serializedData as? [String:AnyObject],
            bornReadyDictionary = jsonDictionary["born-ready"],
            roomsArray = bornReadyDictionary["rooms"] as? [[String:AnyObject]] else { fatalError() }
        
        _ = roomsArray.flatMap { Room(dictionary: $0) }
        completion(success: true)
        
        saveContext()
        
        
    }
    
    
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