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
    
    var rooms: [Room] {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Room")
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        return sortRooms((try? Stack.sharedStack.managedObjectContext.fetch(fetchRequest)) as? [Room] ?? [])
    }
    
    var tasks: [Task] {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        
        return (try? Stack.sharedStack.managedObjectContext.fetch(fetchRequest)) as? [Task] ?? []
    }
    
    func completedTasks(_ room: Room) -> [Task] {
        
        let tasks = room.tasks ?? []
        var tasksInRoom: [Task] = []
        
        for task in tasks {
            if let task = task as? Task {
                tasksInRoom.append(task)
            }
        }
        
        let completedTasksInRoom = tasksInRoom.filter({$0.isComplete.boolValue})
        
        return completedTasksInRoom
    }
    
    func sortRooms(_ rooms: [Room]) -> [Room] {
        
        var roomArray: [Room] = []
        
        for room in rooms {
            switch room.name {
            case "Bathroom":
                roomArray.insert(room, at: 0)
            case "Garage":
                roomArray.insert(room, at: 0)
            case "General":
                roomArray.insert(room, at: 2)
            case "Kitchen":
                roomArray.insert(room, at: 0)
            case "Laundry Room":
                roomArray.insert(room, at: 3)
            case "Living Room":
                roomArray.insert(room, at: 1)
            case "Nursery & Bedroom":
                roomArray.insert(room, at: 2)
            case "Outdoors":
                roomArray.insert(room, at: 5)
            default:
                break
            }
        }
        return roomArray
    }
    
    func serializeJSON(_ completion: (_ rooms: [Room]) -> Void) {
        
        let filePath = Bundle.main.path(forResource: "BornReady", ofType: "json")!
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
            let serializedData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
            let jsonDictionary = serializedData as? [String:AnyObject],
            let bornReadyDictionary = jsonDictionary["born-ready"],
            let roomsArray = bornReadyDictionary["rooms"] as? [[String:AnyObject]] else { return }
        
        let rooms = roomsArray.flatMap { Room(dictionary: $0) }
        completion(rooms)
    }
    
    func isCompleteValueToggled(_ task: Task) {
        
        task.isComplete = !task.isComplete.boolValue as NSNumber
        
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
    
    static func makeSections(_ tasks: [Task]) -> [[Task]] {
        
        var sectionNames: [String] = []
        var sections: [[Task]] = []
        
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
