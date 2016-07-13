//
//  Room.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/11/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import UIKit
import CoreData


class Room: NSManagedObject {
    
    static let kType = "Room"
    
    convenience init(name: String, imageData: NSData, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        guard let entity = NSEntityDescription.entityForName(Room.kType, inManagedObjectContext: context) else { fatalError("Error: Core Data failed to create entity from entity description.") }
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.name = name
        self.imageData = imageData
    }
    
    var photo: UIImage? {
        
        guard let imageData = self.imageData else { return nil }
        
        return UIImage(data: imageData)
    }
    
}