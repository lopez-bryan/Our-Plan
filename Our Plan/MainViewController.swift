//
//  MainViewController.swift
//  Our Plan
//
//  Created by Bryan Lopez on 3/15/19.
//  Copyright © 2019 Lopez Bryan. All rights reserved.
//

import UIKit
import Firebase
//import FirebaseDatabase

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    var ref: DatabaseReference!
//    
//    ref = Database.database().reference()
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = initial
    
//        do {
//            try Auth.auth().signOut()
//        } catch  {
//            print("There was a problem signing out.")
//        }
//        guard(navigationController?.popToRootViewController(animated: true)) != nil
//        else {
//            print("You are signed out.")
//            return;
//        }
    }
    
   

}
