//
//  Room.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/11/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import Foundation
import CoreData

class Room: NSManagedObject {
    
    static let kType = "Room"
    fileprivate static let kName = "name"
    fileprivate static let kImage = "image"
    
    
    convenience init?(dictionary: [String:AnyObject], context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        guard let entity = NSEntityDescription.entity(forEntityName: Room.kType, in: context),
            let name = dictionary[Room.kName] as? String,
            let image = dictionary[Room.kImage] as? String  else { fatalError("Error: Core Data failed to create entity from entity description.") }
        
        self.init(entity: entity, insertInto: context)
        
        self.name = name
        self.imageString = image
        guard let taskDictionaries = (dictionary["tasks"] as? [[String:AnyObject]]) else { return nil }
        let tasks = taskDictionaries.flatMap { Task(dictionary: $0) }
        self.tasks = NSOrderedSet(array: tasks)
    }
}

