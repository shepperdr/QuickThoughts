//
//  EnterThoughtsViewController.swift
//  QuickThoughts
//
//  Created by Robert Shepperd on 11/9/15.
//  Copyright © 2015 Robert Shepperd. All rights reserved.
//

import UIKit

class EnterThoughtsViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet var enterThoughtsView: UIView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    
    var thought: Thoughts?
    var journal: Journal?
    
    let tapRec = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
        enterThoughtsView.addGestureRecognizer(tapRec)
        tapRec.addTarget(self, action: "tappedView")
        
        // Hy added this for visual effects
        UITextField.appearance().tintColor = UIColor.darkGrayColor()
        UITextView.appearance().tintColor = UIColor.darkGrayColor()
        
    }
    
    func tappedView() {
        bodyTextView.resignFirstResponder()
    }
    
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        if let thought = self.thought {
            thought.title = self.titleTextField.text!
            thought.bodyText = self.bodyTextView.text
            
        } else {
            
            let newThought = Thoughts(title: self.titleTextField.text! , bodyText: self.bodyTextView.text)
            
            ThoughtsController.sharedInstance.postThoughtToJournal(self.journal!, thought:newThought , completion: { (success) -> Void in
                if success == true {
                    self.navigationController?.popViewControllerAnimated(true)
                } else {
                    print("Failure posting Thought to Journal")
                }
                
            })
            
            self.thought = newThought
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
    func updateWithThought(thought: Thoughts) {
        self.thought = thought
        self.titleTextField.text = thought.title
        self.bodyTextView.text = thought.bodyText
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
