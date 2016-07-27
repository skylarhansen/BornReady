//
//  Tip.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/11/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import Foundation
import CoreData


class Tip: NSManagedObject {
    
    static let kType = "Tip"
    private static let kText = "text"
    
    
    convenience init?(dictionary: [String:AnyObject], context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        guard let entity = NSEntityDescription.entityForName(Tip.kType, inManagedObjectContext: context),
            text = dictionary[Tip.kText] as? String else { fatalError("Error: Core Data failed to create entity from entity description.") }
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.text = text
    }
}
