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
//            NSNotificationCenter.defaultCenter().postNotificationName(journalsUpdateNotification, object: self)
            
        }
        
    }
    
    init() {
        self.journals = []
        self.loadJournal()
        
    }

    func removeJournal(journal: Journal) {
        if let journalIndex = journals.indexOf(journal) {
            journals.removeAtIndex(journalIndex)
            
        }
        FirebaseController.journalBase.childByAppendingPath("journal").removeValue()
        
    }
    
    func loadJournal() {
        
        let journalRef = FirebaseController.journalBase.childByAppendingPath("journal")
        journalRef.observeEventType(.Value, withBlock: { (snapshot) in
            
            if let journalDict = snapshot.value as? [Dictionary<String, AnyObject>] {
                self.journals = journalDict.map({Journal(dictionary: $0)!})
                
            }
        })
        
    }
    
    
    //    func addJournal(journal: Journal) {
    //        journals.append(journal)
    //        self.saveJournal()
    //    }
    
    //    func saveJournal() {
    //
    //        let journalDict = self.journals.map({$0.dictionaryCopy()})
    //
    //        FirebaseController.journalBase.childByAutoId().setValue(journalDict)
    //    }

    
    
}