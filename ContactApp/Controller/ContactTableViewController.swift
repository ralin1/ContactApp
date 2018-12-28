//
//  ContactTableViewController.swift
//  ContactApp
//
//  Created by Oleksandr Filippov on 27/12/2018.
//  Copyright © 2018 OleksandrFilippov. All rights reserved.
//

import Foundation
import UIKit


class ContactTableViewController: UIViewController {
   
    let cellid = "ContactCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callDelegates()
    }
    
    func callDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ContactTableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! TableViewCell
        cell.titleLabel.text = "hi"
        cell.subtitleLabel.text = "sub"
        return cell
    }
    
    
}

