//
//  AboutUs.swift
//  GraceBaptistChurchCalgary
//
//  Created by Dinesh Thangasamy on 2017-12-15.
//  Copyright © 2017 GBCCalgary. All rights reserved.
//

import Foundation

class AboutUs {
    static let shared = AboutUs()
    private static let collectionName = "about_us"

    var ourStory = ""
    var ourStaff = [Staff]()
    var ourBeliefs = [Belief]()
    
    var count: Int {
        get {
            var count = 0
            if !ourStory.isEmpty {
                count += 1
            }
            
            if ourStaff.count > 0 {
                count += 1
            }
            
            if ourBeliefs.count > 0 {
                count += 1
            }
            return count
        }
    }
    
    var sections: [String] {
        get{
            var sectionData = [String]()
            if !ourStory.isEmpty {
                sectionData.append("Our Story")
            }
            
            if ourStaff.count > 0 {
                sectionData.append("Our Staff")
            }
            
            if ourBeliefs.count > 0 {
                sectionData.append("Our Beliefs")
            }
            return sectionData
        }
    }
    
    static func fetchData(_ completion: @escaping (_ error: NSError?) -> Void ) {
        FirebaseHelper.fetch(AboutUs.collectionName, completion:{(doc,err) in
            guard (err == nil) else {
                completion(err!)
                return
            }
            if let data = doc {
                let aboutus = AboutUs.shared
                aboutus.ourStory = data["story"] as? String ?? ""
               
                if let beliefArr = data["belief"] as? NSArray {
                    //print(beliefArr)
                }
                
                var staffList = [Staff]()
                if let staffArr = data["staff"] as? NSArray {
                    for staff in staffArr {
                        if let staffDict = staff as? [String : Any] {
                            staffList.append(Staff(with: staffDict))
                        }
                    }
                    aboutus.ourStaff = staffList
                }
                completion(nil)
            }
            completion(NSError(domain: "Unable to process data", code: -1, userInfo: nil))
        })
    }
    //Not using for now
    //list of old images and some descriptions
}
