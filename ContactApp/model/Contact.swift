//
//  Contact.swift
//  ContactApp
//
//  Created by Oleksandr Filippov on 27/12/2018.
//  Copyright © 2018 OleksandrFilippov. All rights reserved.
//

import Foundation

struct Contact{
    var name: String
    var surname: String
    var number: String
    var city: String
    
    init(name: String, surname: String, number: String, city: String) {
        self.name = name
        self.surname = surname
        self.number = number
        self.city = city
    }
}
