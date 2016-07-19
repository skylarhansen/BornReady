//
//  Task+CoreDataProperties.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/19/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Task {

    @NSManaged var isBookmarked: NSNumber
    @NSManaged var isComplete: NSNumber
    @NSManaged var section: String
    @NSManaged var text: String
    @NSManaged var room: Room?
    @NSManaged var tips: NSOrderedSet?

}
