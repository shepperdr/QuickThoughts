//
//  FirebaseController.swift
//  QuickThoughts
//
//  Created by Robert Shepperd on 11/9/15.
//  Copyright © 2015 Robert Shepperd. All rights reserved.
//

import Foundation
import Firebase

class FirebaseController {
    
static let sharedInstance = FirebaseController()
    
    static let base = Firebase(url: "https://quickthoughts.firebaseio.com/")
    static let journalBase = base.childByAppendingPath("journal")
    //.childByAppendingPath("autoIDOfJournal").childByAppendingPath("autoIDOfThought") // Endpoint for thoughts
    
    func fetchAllJournals(completion: () -> () ) {
        FirebaseController.journalBase.observeEventType(.Value, withBlock: { (snapshot) -> Void in
            
            let arrayOfJournals = snapshot.children.allObjects
            JournalController.sharedInstance.journals = (arrayOfJournals.map{ Journal.init(snapshot: $0 as! FDataSnapshot)
                })
            
            completion()
        })
        
    }
    

    
//    func fetchAllThoughts(completion: () -> () ) {
//        FirebaseController.thoughtBase.observeEventType(.Value, withBlock: { (snapshot) -> Void in
//            
//            let arrayOfThoughts = snapshot.children.allObjects
//            ThoughtsController.sharedInstance.thoughts = (arrayOfThoughts.map{Thoughts.init(snapshot: $0 as! FDataSnapshot)
//        })
//            completion()
//            
//        })
//    }
    
//    func retrieveCurrentJournalsThoughts() {
//        
//        FirebaseController.journalBase.observeEventType(FEventType.Value, withBlock: { (snapshot) -> Void in
//            <#code#>
//        })
//        
//    }

    
    }

