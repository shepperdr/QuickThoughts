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
    static let userBase = base.childByAppendingPath("user")
    static let journalBase = base.childByAppendingPath("journal")
    
    func fetchAllJournals(completion: () -> () ) {
        FirebaseController.journalBase.observeEventType(.Value, withBlock: { (snapshot) -> Void in
            
            let arrayOfJournals = snapshot.children.allObjects
            JournalController.sharedInstance.journals = (arrayOfJournals.map{ Journal.init(snapshot: $0 as! FDataSnapshot)
                })
            
            completion()
        })
        
    }
    
    func fetchAllThoughts(journal: Journal, completion: () -> () ) {
        
        let specificJournalRef = "\(journal.ref)"
        print(specificJournalRef)
        let specificJournalUID = specificJournalRef.substringWithRange(Range<String.Index>(start: specificJournalRef.startIndex.advancedBy(54), end: specificJournalRef.endIndex.advancedBy(-1)))
        print(specificJournalUID)
        
        FirebaseController.journalBase.childByAppendingPath(specificJournalUID).childByAppendingPath("Thoughts").observeEventType(.Value, withBlock: { (snapshot) -> Void in
            
            let arrayOfThoughts = snapshot.children.allObjects
            ThoughtsController.sharedInstance.thoughts = (arrayOfThoughts.map{Thoughts.init(snapshot: $0 as! FDataSnapshot)
                })
            completion()
            
        })
    }
    

}

