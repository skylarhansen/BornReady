//
//  Task.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/13/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import Foundation
import CoreData


class Task: NSManagedObject {
    
    static let kType = "Task"
    fileprivate static let kText = "text"
    fileprivate static let kSection = "section"
    fileprivate static let kLink = "link"
    
    
    convenience init?(dictionary: [String:AnyObject], context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        guard let entity = NSEntityDescription.entity(forEntityName: Task.kType, in: context),
            let text = dictionary[Task.kText] as? String,
            let section = dictionary[Task.kSection] as? String,
            let link = dictionary[Task.kLink] as? String else { fatalError("Error: Core Data failed to create entity from entity description.") }
        
        self.init(entity: entity, insertInto: context)
        
        self.text = text
        self.isComplete = false
        self.section = section
        self.link = link
        guard let tipDictionaries = (dictionary["tips"] as? [[String:AnyObject]]) else { return nil }
        let tips = tipDictionaries.flatMap { Tip(dictionary: $0) }
        self.tips = NSOrderedSet(array: tips)
        self.room = nil
    }
}
