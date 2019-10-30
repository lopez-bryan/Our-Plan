//
//  RegisterPageViewController.swift
//  Our Plan
//
//  Created by Bryan Lopez on 3/14/19.
//  Copyright © 2019 Lopez Bryan. All rights reserved.
//

import UIKit
import Firebase

class RegisterPageViewController: UIViewController {
    

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Display an alert message
    func displayMyAlertMessage(userMessage: String) {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil);
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let repeatPassword = repeatPasswordTextField.text;
        
        // Check fields to make sure they are not empty
        if ((userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (repeatPassword?.isEmpty)!) {
            // Display message to user a field is empty
            displayMyAlertMessage(userMessage: "All fields are required");
            return;
        }
        
        // Check if passwords match
        if userPassword != repeatPassword {
            // Display alert message
            displayMyAlertMessage(userMessage: "Passwords do not match.");
            return;
        }
        
        // Store Data
        Auth.auth().createUser(withEmail: userEmail!, password: userPassword!, completion: {(user, error ) in
            if (error != nil) { print(error!) }
            else {
                print("Registration Successful")
                }
            } )
        
        
        
        // Display message with confirmation
        let myAlert = UIAlertController(title: "Alert", message: "Registration Successful", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ action in
            self.dismiss(animated: true, completion: nil)
        }
        
                myAlert.addAction(okAction);
                self.present(myAlert, animated: true, completion: nil);

        
        
    }
    
    
}
