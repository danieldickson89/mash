//
//  MashController.swift
//  Mash
//
//  Created by Daniel Dickson on 6/29/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import Foundation
import CoreData

class MashController {
    
    static let sharedController = MashController()
    
    var allMash: [Mash] {
        let request = NSFetchRequest(entityName: "Mash")
        let moc = Stack.sharedStack.managedObjectContext
        
        do {
            let array = try moc.executeFetchRequest(request) as! [Mash]
            
            return array
            
        } catch {
            return []
        }
    }
    
    func addMash(mash: Mash) {
        
        self.saveToPersistence()
    }
    
    func removeMash(mash: Mash) -> () {
        if let moc = mash.managedObjectContext {
            moc.deleteObject(mash)
        }
        saveToPersistence()
    }
    
    // Save Core Data
    func saveToPersistence() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Error saving \(error)")
        }
    }
}