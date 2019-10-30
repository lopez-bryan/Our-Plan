//
//  ViewListViewController.swift
//  Our Plan
//
//  Created by Bryan Lopez on 3/18/19.
//  Copyright © 2019 Lopez Bryan. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseFirestore

var list = [String]()

class ViewListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var input: UITextField!
    
    // Created a docRef. This docRef accesses the database and is set to stores(collection) and document(list)
    var docRef: DocumentReference!
    
    //db.collection("stores").document("list").setData([ "item": true ], merge: true)
    
    
    @IBAction func addItem(_ sender: Any) {
        guard let item = input.text, !item.isEmpty else { return }
        let dataToSave: [String: Any] = ["myItem": item]
        docRef.setData(dataToSave)  { (error) in
            if let error = error {
                print("Oh no, we got an error: \(error.localizedDescription)")
            }else {
                print("Data has been saved")
            }
            self.input.text = ""
        }
        
        // The code below is to show the list without loading it to a database
//        if (input.text != "") {
//            list.append(input.text!)
//            input.text = ""
//            myTableView.reloadData()
//        }
    }
    
    
    
    
    // View list
    @IBAction func refresh(_ sender: Any) {
//        let docRef = db.collection("cities").document("SF")
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                list.append(dataDescription)
                self.myTableView.reloadData()
//                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
        
        
        
        
        //        if (input.text != "") {
        //            list.append(input.text!)
        //            input.text = ""
        //            myTableView.reloadData()
        //        }

    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        docRef = Firestore.firestore().collection("stores").document("list");
        
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                list.append(dataDescription)
                self.myTableView.reloadData()
                //                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            
            }
        }
        
//            docRef.getDocument { (docSnapshot, error) in
//            guard let docSnapshot = docSnapshot, docSnapshot.exists else { return }
//            let myData = docSnapshot.data()
//            let latestItem = myData!["item"] as? String ?? ""
//            self.input.text = "\(latestItem)"
//            self.myTableView.reloadData()
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list.count)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            list.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return (cell)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func addItemToList(_ sender: UIButton) {
//        
//    }
    
}
