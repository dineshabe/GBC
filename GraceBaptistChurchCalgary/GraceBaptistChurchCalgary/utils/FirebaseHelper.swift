//
//  FirebaseHelper.swift
//  GraceBaptistChurchCalgary
//
//  Created by Dinesh Thangasamy on 2017-12-15.
//  Copyright © 2017 GBCCalgary. All rights reserved.
//

import Foundation
import Firebase

class FirebaseHelper {
    static func fetch(_ collectionName: String = "", completion: @escaping (_ doc: [String: Any]?, _ error: NSError?) -> Void) -> Void{
        let defaultStore = Firestore.firestore()
        defaultStore.collection(collectionName).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(nil, NSError(domain: err.localizedDescription, code: 0, userInfo: nil))
            } else {
                if let doc = querySnapshot?.documents.first {
                    completion(doc.data(),nil)
                }
            }
            completion(nil, nil)
            
        }
    }
}
