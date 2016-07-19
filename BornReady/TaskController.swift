//
//  TaskController.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/11/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let sharedController = TaskController()
    
    var room: Room?
    
    var rooms: [Room] {
        let fetchRequest = NSFetchRequest(entityName: "Room")
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return (try? Stack.sharedStack.managedObjectContext.executeFetchRequest(fetchRequest)) as? [Room] ?? []
    }
    
    var tasks: [Task] {
        let fetchRequest = NSFetchRequest(entityName: "Task")
        let sortDescriptor = NSSortDescriptor(key: "text", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return (try? Stack.sharedStack.managedObjectContext.executeFetchRequest(fetchRequest)) as? [Task] ?? []
    }
    
    func serializeJSON(completion: (rooms: [Room]) -> Void) {
        
        let filePath = NSBundle.mainBundle().pathForResource("BornReady", ofType: "json")!
        
        guard let data = NSData(contentsOfFile: filePath),
            serializedData = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments),
            jsonDictionary = serializedData as? [String:AnyObject],
            bornReadyDictionary = jsonDictionary["born-ready"],
            roomsArray = bornReadyDictionary["rooms"] as? [[String:AnyObject]] else { return }
        
        let rooms = roomsArray.flatMap { Room(dictionary: $0) }
        completion(rooms: rooms)
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
    
    static func makeSections(tasks: [Task]) -> [[Task]] {
        var sectionNames = [String]()
        var sections = [[Task]]()
        for task in tasks {
            if sectionNames.contains(task.section) == false {
                sectionNames.append(task.section)
            }
        }
        for sectionName in sectionNames {
            let sectionArray = tasks.filter { $0.section == sectionName }
            sections.append(sectionArray)
        }
        return sections
    }
}
