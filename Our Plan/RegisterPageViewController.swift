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
    @IBOutlet weak var firstNameTextField: UITextField!
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
    
    // check the fields and validate the data is correct. If correct, method returns nil otherwise returns string.
    func validateFields() -> String? {
        
        if userEmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            
            firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            userPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }
        
        // check if password is secure
        let cleanedPassword = userPasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // maybe needs to use function displayMyAlertMessage here.
            return "Please make sure your password is at least 8 characters, contains a special character and a number"
        }
        
        return nil
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let firstName = firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let userEmail = userEmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let userPassword = userPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let repeatPassword = repeatPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Check fields to make sure they are not empty
        if ((userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (repeatPassword?.isEmpty)! || (firstName?.isEmpty)!) {
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
                let db = Firestore.firestore()
                
                db.collection("users").addDocument(data: ["firstname": firstName!,"uid": user!.user.uid], completion: { (error) in
                    
                    if error != nil {
                        print("Error saving user data")
                    }
                })
                print("Registration Successful")
                
//                // transition to home screen
//                transitionToHome()
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
    
//    func transitionToHome() {
//
//        storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController)
//    }
    
    
}
