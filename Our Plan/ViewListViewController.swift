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
    
    @IBOutlet weak var labelDisplay: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var addItem: UITextField!
    
    var finalLabel = ""
    
    
    // Created a docRef. This docRef accesses the database and is set to stores(collection) and document(list)
    var docRef: DocumentReference!
    let db = Firestore.firestore()
    
    
    
    
    
    
    
    
//    // View list
//    @IBAction func refresh(_ sender: Any) {
////        let docRef = db.collection("cities").document("SF")
//
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                list.append(dataDescription)
//                self.myTableView.reloadData()
////                print("Document data: \(dataDescription)")
//            } else {
//                print("Document does not exist")
//            }
//        }
//
//
//
//
//                if (input.text != "") {
//                    list.append(input.text!)
//                    input.text = ""
//                    myTableView.reloadData()
//                }
//
//    }

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelDisplay.text = finalLabel

        
        
        
        
        docRef = Firestore.firestore().collection("stores").document(finalLabel)
        
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                print("Document data: \(dataDescription)")
//            } else {
//                print("Document does not exist")
//            }
//        }


//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                list.append(dataDescription)
//                self.myTableView.reloadData()
//                //                print("Document data: \(dataDescription)")
//            } else {
//                print("Document does not exist")
//            }
//        }
//
//
//
//
//        if (input.text != "") {
//            list.append(input.text!)
//            input.text = ""
//            myTableView.reloadData()
//        }

        
                

        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                list.append(dataDescription)
                self.addItem.text = "";
                self.myTableView.reloadData()
                                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")

            }
        }
    }
    
    
    
    
    
//    let washingtonRef = db.collection("cities").document("DC")
    
    // Atomically add a new region to the "regions" array field.
//    washingtonRef.updateData([
//    "regions": FieldValue.arrayUnion(["greater_virginia"])
//    ])
    
    // Atomically remove a region from the "regions" array field.
//    washingtonRef.updateData([
//    "regions": FieldValue.arrayRemove(["east_coast"])
//    ])
    
    
    
    
    @IBAction func addItemButton(_ sender: Any) {
        
        guard var inputItem = addItem.text, !inputItem.isEmpty else { return }
        
        let db = Firestore.firestore()
        
        // Puts items in the list store 
        let newDocument = db.collection("stores").document(finalLabel)
            newDocument.updateData([
            "items": FieldValue.arrayUnion([inputItem])
            ])
        
        
//        newDocument.setData(["item": inputItem], merge: true)
        addItem.text = ""
        self.myTableView.reloadData()
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
//            myTableView.reloadData()
//            DispatchQueue.main.async { self.myTableView.reloadData() }
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

    
}
