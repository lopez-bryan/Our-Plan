//
//  CreateListViewController.swift
//  Our Plan
//
//  Created by Bryan Lopez on 3/18/19.
//  Copyright © 2019 Lopez Bryan. All rights reserved.
//

import UIKit

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
    
    @IBAction func addItemButtonTapped(_ sender: Any) {
        guard let storeText = storeTextField.text, !storeText.isEmpty else { return }
//        guard let itemText = itemTextField.text, !itemText.isEmpty else { return }
    }
    
    

}
