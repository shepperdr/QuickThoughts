//
//  JournalController.swift
//  QuickThoughts
//
//  Created by Robert Shepperd on 11/11/15.
//  Copyright © 2015 Robert Shepperd. All rights reserved.
//

import Foundation
import Firebase

public let journalsUpdateNotification = "journalsUpdateNotification"

class JournalController {
    
    private let journalKey = "journal"
    
    static let sharedInstance = JournalController()
    
    var journals:[Journal] {
        
        didSet {
            
        }
        
    }
    
    init() {
        self.journals = []
        self.loadJournal()
        
    }

    func removeJournal(journal: Journal) {

        journal.ref?.removeValue()
        if let index = self.journals.indexOf(journal) {
             self.journals.removeAtIndex(index)
        }
       
        
    }
    
    func loadJournal() {
        
        let journalRef = FirebaseController.journalBase
        journalRef.observeEventType(.Value, withBlock: { (snapshot) in
            
            if let journalDict = snapshot.value as? [Dictionary<String, AnyObject>] {
                self.journals = journalDict.map({Journal(dictionary: $0)!})
                
            }
        })
        
    }
    
    
}