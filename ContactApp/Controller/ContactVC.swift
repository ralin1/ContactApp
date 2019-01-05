//
//  ContactVC.swift
//  ContactApp
//
//  Created by Oleksandr Filippov on 27/12/2018.
//  Copyright © 2018 OleksandrFilippov. All rights reserved.
//


import UIKit
import CoreData


class ContactVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var numberTestField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButton(_ sender: Any) {
        saveContact { (done) in
            if done{
                print("We need to return new")
                navigationController?.popViewController(animated: true)
                self.dismiss(animated: true, completion: nil)
            }else{
                print("try again")
            }
        }
    }
    // MARK: - Saving
    
    func saveContact(complition: (_ finished: Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let contact = Contact(context: managedContext)
        contact.name = nameTextField.text
        contact.surname = surnameTextField.text
        contact.city = cityTextField.text
        contact.number = numberTestField.text
        do{
            try managedContext.save()
            print("Data saved")
            complition(true)
        }catch{
            print("Faild to save", error.localizedDescription)
            complition(false)
        }
    }
    
}

