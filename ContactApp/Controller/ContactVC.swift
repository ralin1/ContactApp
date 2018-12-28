//
//  ContactVC.swift
//  ContactApp
//
//  Created by Oleksandr Filippov on 27/12/2018.
//  Copyright © 2018 OleksandrFilippov. All rights reserved.
//

import Foundation
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
    }
    
    func saveContact(){
        
    }
}
