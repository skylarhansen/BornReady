//
//  Task.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/11/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import Foundation
import CoreData


class Task: NSManagedObject {
    
    static let kType = "Task"

    convenience init(text: String, isComplete: Bool = false, isBookmarked: Bool = false, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        guard let entity = NSEntityDescription.entityForName(Task.kType, inManagedObjectContext: context) else { fatalError("Error: Core Data failed to create entity from entity description.") }
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.text = text
        self.isComplete = isComplete
        self.isBookmarked = isBookmarked
    }

}
