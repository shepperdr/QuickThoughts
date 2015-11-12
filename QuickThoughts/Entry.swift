//
//  Entry.swift
//  QuickThoughts
//
//  Created by Robert Shepperd on 11/11/15.
//  Copyright © 2015 Robert Shepperd. All rights reserved.
//

import Foundation


class Entry: Equatable {
    
    private let titleKey = "title"
    private let bodyTextKey = "bodyText"
    
    
    var title: String
    var bodyText: String
    
    init(title:String, bodyText: String) {
        self.bodyText = bodyText
        self.title = title
        
    }
    
    init?(dictionary: Dictionary<String, AnyObject>) {
        guard let title = dictionary[titleKey] as? String,
            let bodyText = dictionary[bodyTextKey] as? String else {
                self.title = ""
                self.bodyText = ""
                
                return nil
        }
        self.bodyText = bodyText
        self.title = title
    }
    
    func dictionaryCopy() -> Dictionary<String, AnyObject> {
        let dictionary = [
            titleKey : self.title,
            bodyTextKey : self.bodyText ]
        
        return dictionary
    }
}

func == (lhs:Entry, rhs:Entry) ->Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}