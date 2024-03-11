//
//  DataContoller.swift
//  BookWorm
//
//  Created by Dip Dutt on 30/12/23.
//

import Foundation
import CoreData

// MARK: - Create DataController

class DataController:ObservableObject {
    
    let persistancecontainer = NSPersistentContainer(name:"BookWorm")
    
    // MARK: - Create init to load CoreDataModel
    
    init() {
        
        persistancecontainer.loadPersistentStores { description, error in
            if let error = error {
                print("Error Loadig core Data:\(error.localizedDescription)")
            }
            
            else {
                print("core data load successfully")
            }
        }
    }
    
}

