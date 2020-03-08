//
//  LoginViewController.swift
//  Our Plan
//
//  Created by Bryan Lopez on 3/15/19.
//  Copyright © 2019 Lopez Bryan. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func loginButtonPressed(_ sender: Any) {
        // userEmailTextField.text!
        // userPasswordTextField.text!
        
        
        Auth.auth().signIn(withEmail: "claire@gmail.com", password: "Claire12345!" ) { (user, error) in
                if error == nil{
                    print("Login Successful")
                    self.performSegue(withIdentifier: "loginGoToMain", sender: self)
                }
                else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }

    }

}

