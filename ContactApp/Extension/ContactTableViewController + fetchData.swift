//
//  ContactTableViewController + fetchData.swift
//  ContactApp
//
//  Created by Oleksandr Filippov on 12/04/2020.
//  Copyright © 2020 OleksandrFilippov. All rights reserved.
//

import UIKit
import CoreData

extension ContactTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactArray.count
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.ContactArray[sourceIndexPath.row]
        ContactArray.remove(at: sourceIndexPath.row)
        ContactArray.insert(movedObject, at: destinationIndexPath.row)
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
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.deleteData(indexPath: indexPath)
            self.setData()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [deleteAction]
    }
    
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
    //Mark: - Add to next Controller
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you selected cell \(indexPath.row)")
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ContactViewController") as! ContactViewController
        let contact = ContactArray[indexPath.row]
        vc.nameContact = contact.name
        vc.surnameContact = contact.surname
        vc.cityContact = contact.city
        vc.numberContact = contact.number
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
