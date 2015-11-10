//
//  Thoughts.swift
//  QuickThoughts
//
//  Created by Robert Shepperd on 11/9/15.
//  Copyright © 2015 Robert Shepperd. All rights reserved.
//

import Foundation

class Thoughts: Equatable {
    
    
    var title: String
    var bodyText: String
    
    init(title:String, bodyText: String) {
        self.bodyText = bodyText
        self.title = title
        
    }
}

func == (lhs:Thoughts, rhs:Thoughts) ->Bool {
    return (lhs.title == rhs.title) && (lhs.bodyText == rhs.bodyText)
}