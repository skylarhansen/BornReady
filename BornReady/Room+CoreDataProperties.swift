//
//  Room+CoreDataProperties.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/18/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Room {

    @NSManaged var imageString: String
    @NSManaged var name: String
    @NSManaged var tasks: NSOrderedSet?
    
}

