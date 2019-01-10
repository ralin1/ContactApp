//
//  ContactViewController.swift
//  ContactApp
//
//  Created by Oleksandr Filippov on 03/01/2019.
//  Copyright © 2019 OleksandrFilippov. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var nameContact: String?
    var surnameContact: String?
    var cityContact: String?
    var numberContact: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = nameContact?.description
        surnameLabel.text = surnameContact?.description
        cityLabel.text = cityContact?.description
        numberLabel.text = numberContact?.description
    }
    
    
    @IBAction func callingNumber(_ sender: Any) {
        print("asd")
        if let number = numberContact?.description{
            if let url = URL(string: "tel://\(number)"),
                UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler:nil)
                    print("call")
                } else {
                    UIApplication.shared.openURL(url)
                }
            } else {
                print("cant call to \(number)")
            }
        }
        
    }
    

   
}
