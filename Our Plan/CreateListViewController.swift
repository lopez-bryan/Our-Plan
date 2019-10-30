//
//  CreateListViewController.swift
//  Our Plan
//
//  Created by Bryan Lopez on 3/18/19.
//  Copyright © 2019 Lopez Bryan. All rights reserved.
//

import UIKit
import Firebase

class CreateListViewController: UIViewController {
    @IBOutlet weak var storeTextField: UITextField!
//    @IBOutlet weak var itemTextField: UITextField!
    
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
    
    @IBAction func addItemButtonTapped(_ sender: Any) {
//        guard let storeText = storeTextField.text, !storeText.isEmpty else { return }
         let storeText = storeTextField.text;
        
        // Check fields to make sure they are not empty
        if ((storeText?.isEmpty))! {
            // Display message to user a field is empty
            displayMyAlertMessage(userMessage: "Field is empty!");
            return;
            
//            let dataToSave: String: Any = ["ourList": ]
        }
        
        
    }
    
    

}
