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
    fileprivate static let kText = "text"
    
    
    convenience init?(dictionary: [String:AnyObject], context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        guard let entity = NSEntityDescription.entity(forEntityName: Tip.kType, in: context),
            let text = dictionary[Tip.kText] as? String else { fatalError("Error: Core Data failed to create entity from entity description.") }
        
        self.init(entity: entity, insertInto: context)
        
        self.text = text
    }
}
