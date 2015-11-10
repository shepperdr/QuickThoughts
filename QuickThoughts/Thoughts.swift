//
//  Thoughts.swift
//  QuickThoughts
//
//  Created by Robert Shepperd on 11/9/15.
//  Copyright © 2015 Robert Shepperd. All rights reserved.
//

import Foundation

class Thoughts: Equatable {
    
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

func == (lhs:Thoughts, rhs:Thoughts) ->Bool {
    return (lhs.title == rhs.title) && (lhs.bodyText == rhs.bodyText)
}