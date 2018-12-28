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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

extension ContactTableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! TableViewCell
        let contact = ContactArray[indexPath.row]
        cell.titleLabel.text = "\(contact.name!) \(contact.surname!)"
        cell.subtitleLabel.text = "\(contact.number!) \(contact.city!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.deleteData(indexPath: indexPath)
            self.setData()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [deleteAction]
    }
}

extension ContactTableViewController{
    func fetchData(complition: (_ complite: Bool) -> ())  {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
        do{
            ContactArray = try managedContext.fetch(request) as! [Contact]
            print("Data fetched!")
            complition(true)
        }catch {
            print("Unable to fetch Data", error.localizedDescription)
            complition(false)
        }
        
    }
    func deleteData(indexPath: IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        managedContext.delete(ContactArray[indexPath.row])
        
        do{
            try managedContext.save()
            print("Data delete")
        }catch{
            print("Faild to delete data", error.localizedDescription)
        }
    }
}
