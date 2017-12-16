//
//  Staff.swift
//  GraceBaptistChurchCalgary
//
//  Created by Dinesh Thangasamy on 2017-12-15.
//  Copyright © 2017 GBCCalgary. All rights reserved.
//

import Foundation

class Staff {
    var description: String = ""
    var email: String = ""
    var image: String = ""
    var name: String = ""
    var position: String = ""
    
    init(with data: [String : Any]) {
        self.description = data["description"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.image = data["image"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.position = data["position"] as? String ?? ""
    }
}
