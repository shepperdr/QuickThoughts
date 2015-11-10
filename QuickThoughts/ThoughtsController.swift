//
//  ThoughtsController.swift
//  QuickThoughts
//
//  Created by Robert Shepperd on 11/9/15.
//  Copyright © 2015 Robert Shepperd. All rights reserved.
//

import Foundation
import Firebase

public let thoughtsUpdateNotification = "thoughtsUpdateNotification"
class ThoughtsController {
    
   private let thoughtsKey = "thoughts"
    
    static let sharedInstance = ThoughtsController()
    
    var thoughts:[Thoughts] {
    
        didSet {
            NSNotificationCenter.defaultCenter().postNotificationName(thoughtsUpdateNotification, object: self)
            
        }
        
    }
    
    init() {
        self.thoughts = []
        
    }
    
    
    func addThoughts(thought: Thoughts) {
        thoughts.append(thought)
        
    }
    
    
    func removeThoughts(thought: Thoughts) {
        if let thoughtsIndex = thoughts.indexOf(thought) {
            thoughts.removeAtIndex(thoughtsIndex)
            
        }
        
    }
    
   
    func saveThoughts() {
        
    }
    
    
    func loadThoughts() {
        
        
    }
    
    
}