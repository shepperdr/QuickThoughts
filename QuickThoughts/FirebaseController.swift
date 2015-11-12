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
    
    static let base = Firebase(url: "https://quickthoughts.firebaseio.com/")
    static let thoughtBase = base.childByAppendingPath("thoughts")
    static let journalBase = base.childByAppendingPath("journal")
    
    }

