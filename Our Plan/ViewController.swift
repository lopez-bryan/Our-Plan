//
//  ViewController.swift
//  Our Plan
//
//  Created by Bryan Lopez on 3/14/19.
//  Copyright © 2019 Lopez Bryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        
        if !isUserLoggedIn {
            self.performSegue(withIdentifier: "loginView", sender: self);
        }
    }
    
    

}

