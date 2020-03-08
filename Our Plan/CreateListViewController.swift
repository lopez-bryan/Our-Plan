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
    
   
    @IBOutlet weak var createNewListLabel: UILabel!
    @IBOutlet weak var createNewListTextField: UITextField!
    var nameList = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
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
    
    @IBAction func createListButtonTapped(_ sender: Any) {
        // create access to the firestore database
        let db = Firestore.firestore()
        
        // grab variable user input and check it
        guard let newList = createNewListTextField.text, !newList.isEmpty else { return }
        
        // check if fields are empty or not
        if ((newList.isEmpty)) {
            // display alert message
            displayMyAlertMessage(userMessage: "Field is empty!")
            return
        }
        
        // grab the document to create a new one with it
        // TODO This saves into users document and creates a new document with user input for store. Need to figure out user by uid.
        let newDocument =  db.collection("stores").document(newList)
        newDocument.setData(["storename":newList, "id":newDocument.documentID])
        

        self.nameList = newList
        
        performSegue(withIdentifier: "NewList", sender: self)
        
        //        db.collection("users").document("J82h5ceua2NYRv7spm38").collection("uid").addDocument()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewListViewController
        vc.finalLabel = self.nameList
    }
    
    
    
//    @IBAction func addItemButtonTapped(_ sender: Any) {
////        guard let storeText = storeTextField.text, !storeText.isEmpty else { return }
//         let storeText = storeTextField.text;
//
//        // Check fields to make sure they are not empty
//        if ((storeText?.isEmpty))! {
//            // Display message to user a field is empty
//            displayMyAlertMessage(userMessage: "Field is empty!");
//            return;
//
////            let dataToSave: String: Any = ["ourList": ]
//        }
//
//        
//    }
}
