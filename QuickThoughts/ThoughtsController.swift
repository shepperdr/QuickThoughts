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
        self.loadThoughts()
        
    }
    
    
    func addThoughts(thought: Thoughts) {
        thoughts.append(thought)
        self.saveThoughts()
        
    }
    
    
    func removeThoughts(thought: Thoughts) {
        if let thoughtsIndex = thoughts.indexOf(thought) {
            thoughts.removeAtIndex(thoughtsIndex)
           
        }
        
    }
    
   
    func saveThoughts() {
    
        let thoughtDict = self.thoughts.map({$0.dictionaryCopy()})
        
        FirebaseController.thoughtBase.setValue(thoughtDict)
    }
    
    
    func loadThoughts() {
       
        let thoughtsRef = FirebaseController.thoughtBase
        thoughtsRef.observeEventType(.Value, withBlock: { (snapshot) -> Void in
            
            if let thoughtDict = snapshot.value as? [Dictionary<String, AnyObject>] {
                self.thoughts = thoughtDict.map({Thoughts(dictionary: $0)!})
                
            }
        })
        
    }
    
    
}