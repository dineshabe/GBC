//
//  Church.swift
//  GraceBaptistChurchCalgary
//
//  Created by Dinesh Thangasamy on 2017-12-15.
//  Copyright © 2017 GBCCalgary. All rights reserved.
//

import Foundation

class Church {
    private static let collectionName = "info"
    static let shared = Church()

    var name: String = ""
    var phone: String = ""
    var fax: String = ""
    var address: String = ""
    var facebookUrl: String = ""
    var email: String = ""
    var iconMain: String = ""
    var iconSmall: String = ""

    //Should be an array of "services" in the future
    var service: String = ""
    
    static func fetchData(_ completion: @escaping (_ error: NSError?) -> Void ) {
        FirebaseHelper.fetch(Church.collectionName, completion:{(doc,err) in
            guard (err == nil) else {
                completion(err!)
                return
            }
            if let data = doc {
                let church = Church.shared
                church.name = data["name"] as? String ?? ""
                church.phone = data["phone"] as? String ?? ""
                church.fax = data["fax"] as? String ?? ""
                church.address = data["address"] as? String ?? ""
                church.facebookUrl = data["facebook"] as? String ?? ""
                church.email = data["email"] as? String ?? ""
                church.iconMain = data["iconMain"] as? String ?? ""
                church.iconSmall = data["iconSmall"] as? String ?? ""
                church.service = data["sunday_service"] as? String ?? ""
                completion(nil)
            }
            completion(NSError(domain: "Unable to process data", code: -1, userInfo: nil))
        })
    }
}
