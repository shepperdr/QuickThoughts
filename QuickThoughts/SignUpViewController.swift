//
//  SignUpViewController.swift
//  QuickThoughts
//
//  Created by Robert Shepperd on 11/11/15.
//  Copyright © 2015 Robert Shepperd. All rights reserved.
//

import UIKit
import Firebase


class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createUserName: UITextField!
    @IBOutlet weak var passwordStepOne: UITextField!
    @IBOutlet weak var passwordStepTwo: UITextField!
    @IBOutlet weak var validEmailAddress: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createUserName.delegate = self
        passwordStepOne.delegate = self
        passwordStepTwo.delegate = self
        validEmailAddress.delegate = self
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
//    @IBAction func signupButtonTapped(sender: AnyObject) {
//        
//        let emailAddress = validEmailAddress.text
//        let password = passwordStepOne.text
//        let confirmPassword = passwordStepTwo.text
//        let username = createUserName.text
//        
//        let user = Firebase()
    
        // gonna use something like this for login. 
        
//        if emailAddress != "" && password != "" && confirmPassword != ""  {
//            user.signUpInBackgroundWithBlock {
//                (succeeded, error) -> Void in
//                if error == nil {
//                    // Hooray! Let them use the app now.
//                    self.performSegueWithIdentifier("unwindToCart", sender: nil)
//                    
//                } else {
//                    
//                    let alert = UIAlertController(title: "Oops!", message: "There's been an error while signing up.", preferredStyle: .Alert)
//                    
//                    
//                    let OKPressed = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
//                        UIAlertAction in
//                        print("OK Pressed")
//                    }
//                    
//                    alert.addAction(OKPressed)
//                    
//                    self.presentViewController(alert, animated: true, completion: nil)
//                    
//                    // Show the errorString somewhere and let the user try again.
//                }
//            }
//            
//        } else {
//            let alert = UIAlertController(title: "Oops!", message: "Please fill all fields to signup.", preferredStyle: .Alert)
//            
//            
//            let OKPressed = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
//                UIAlertAction in
//                print("OK Pressed")
//            }
//            
//            alert.addAction(OKPressed)
//            
//            self.presentViewController(alert, animated: true, completion: nil)
//    }

        // adds style to the new user textfields
    override func viewDidLayoutSubviews() {
        let border = CALayer()
        let width = CGFloat (0.5)
        border.borderColor = UIColor.darkGrayColor().CGColor
        
        // createUserName textField
        border.frame = CGRect(x: 0, y: createUserName.frame.size.height - width, width: createUserName.frame.size.width, height: createUserName.frame.size.height)
        
        // passwordStepOne textfield
        border.frame = CGRect(x: 0, y: passwordStepOne.frame.size.height - width, width: passwordStepOne.frame.size.width, height: passwordStepOne.frame.size.height)
        
        // passwordStepTwo textfield
        border.frame = CGRect(x: 0, y: passwordStepTwo.frame.size.height - width, width: passwordStepTwo.frame.size.width, height: passwordStepTwo.frame.size.height)
        
        // validEmailAddress textfield
        border.frame = CGRect(x: 0, y: validEmailAddress.frame.size.height - width, width: validEmailAddress.frame.size.width, height: validEmailAddress.frame.size.height)
        
        border.borderWidth = width
        
        createUserName.layer.addSublayer(border)
        createUserName.layer.masksToBounds = true
        
        passwordStepOne.layer.addSublayer(border)
        passwordStepOne.layer.masksToBounds = true
        
        passwordStepTwo.layer.addSublayer(border)
        passwordStepTwo.layer.masksToBounds = true
        
        validEmailAddress.layer.addSublayer(border)
        validEmailAddress.layer.masksToBounds = true
    }

}
