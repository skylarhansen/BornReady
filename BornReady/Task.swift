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
    private static let kText = "text"
    private static let kSection = "section"
    
    convenience init(text: String, section: String, isComplete: Bool = false, isBookmarked: Bool = false, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        guard let entity = NSEntityDescription.entityForName(Task.kType, inManagedObjectContext: context) else { fatalError("Error: Core Data failed to create entity from entity description.") }
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.text = text
        self.isComplete = isComplete
        self.isBookmarked = isBookmarked
        self.section = section
    }
    
    // JSON init
    convenience init?(dictionary: [String:AnyObject], context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        guard let entity = NSEntityDescription.entityForName(Task.kType, inManagedObjectContext: context),
            text = dictionary[Task.kText] as? String,
            section = dictionary[Task.kSection] as? String else { fatalError("Error: Core Data failed to create entity from entity description.") }
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.text = text
        self.section = section
        guard let tipDictionaries = (dictionary["tips"] as? [[String:AnyObject]]) else { return nil }
        let tips = tipDictionaries.flatMap { Tip(dictionary: $0) }
        self.tips = NSOrderedSet(array: tips)
        
//        tips.flatMap { print($0.text) }
    }
}
