//
//  ContactTableViewController.swift
//  ContactApp
//
//  Created by Oleksandr Filippov on 27/12/2018.
//  Copyright © 2018 OleksandrFilippov. All rights reserved.
//

import Foundation
import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class ContactTableViewController: UIViewController {
    
    var ContactArray = [Contact]()
   
    let cellid = "ContactCell"
    var valueToPass: String!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true
        callDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setData()
        tableView.reloadData()
    }
    func setData(){
        fetchData { (done) in
            if done{
                print("Data is ready to used")
                if ContactArray.count > 0{
                    tableView.isHidden = false
                }else{
                    tableView.isHidden = true
                }
            }
        }
    }
    
    func callDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
    }
}


