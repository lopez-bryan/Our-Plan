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
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//        {
//            if segue.destination is MainViewController
//            {
//                let vc = segue.destination as? MainViewController
//                vc?.username =  user
//            }
//        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
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
    
    }
    
   

}
