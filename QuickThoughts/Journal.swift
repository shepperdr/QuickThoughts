//
//  Journal.swift
//  QuickThoughts
//
//  Created by Robert Shepperd on 11/11/15.
//  Copyright © 2015 Robert Shepperd. All rights reserved.
//

import Foundation
import Firebase

class Journal: Equatable {
    
    private let titleKey = "title"
//    private let journalIDKey = "journalID"
    
    var title: String
//    var journalID: String
    
    init(title:String) {
        
        self.title = title
//        self.journalID = journalID
        
    }
    
    init(snapshot: FDataSnapshot) {
        
        title = snapshot.value["title"] as! String

    }
    
    init?(dictionary: Dictionary<String, AnyObject>) {
        guard let title = dictionary[titleKey] as? String else {
                self.title = ""
//                self.journalID = ""
                return nil
        }
       
        self.title = title
//        self.journalID = journalID
    }
    
    func dictionaryCopy() -> Dictionary<String, AnyObject> {
        let dictionary = [titleKey : self.title]
//            journalIDKey : self.journalID]
        
        return dictionary
    }
}

func == (lhs:Journal, rhs:Journal) ->Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}