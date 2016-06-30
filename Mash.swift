//
//  Mash.swift
//  Mash
//
//  Created by Daniel Dickson on 6/29/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import Foundation
import CoreData


class Mash: NSManagedObject {
    
    convenience init(home1: String, home2: String, home3: String, home4: String, person1: String, person2: String, person3: String, person4: String, vehicle1: String, vehicle2: String, vehicle3: String, vehicle4: String, place1: String, place2: String, place3: String, place4: String, numOfKids1: String, numOfKids2: String, numOfKids3: String, numOfKids4: String, pet1: String, pet2: String, pet3: String, pet4: String, career1: String, career2: String, career3: String, career4: String, theNumber: Int, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        let entity = NSEntityDescription.entityForName("Mash", inManagedObjectContext: context)!
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.home1 = home1
        self.home2 = home2
        self.home3 = home3
        self.home4 = home4
        self.person1 = person1
        self.person2 = person2
        self.person3 = person3
        self.person4 = person4
        self.vehicle1 = vehicle1
        self.vehicle2 = vehicle2
        self.vehicle3 = vehicle3
        self.vehicle4 = vehicle4
        self.place1 = place1
        self.place2 = place2
        self.place3 = place3
        self.place4 = place4
        self.numOfKids1 = numOfKids1
        self.numOfKids2 = numOfKids2
        self.numOfKids3 = numOfKids3
        self.numOfKids4 = numOfKids4
        self.pet1 = pet1
        self.pet2 = pet2
        self.pet3 = pet3
        self.pet4 = pet4
        self.career1 = career1
        self.career2 = career2
        self.career3 = career3
        self.career4 = career4
        self.theNumber = theNumber
    }
}
