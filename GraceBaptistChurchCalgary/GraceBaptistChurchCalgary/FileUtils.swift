//
//  FileUtils.swift
//  GraceBaptistChurchCalgary
//
//  Created by Dinesh Thangasamy on 2017-12-13.
//  Copyright © 2017 GBCCalgary. All rights reserved.
//

import Foundation

class FileUtils {
    
    enum dataType{
        case array
        case dictionary
    }
    
    func getJsonData(_ filePath: String, _ dataType: FileUtils.dataType = .dictionary) -> Any? {
        guard let path = Bundle(for: type(of: self)).path(forResource: filePath, ofType: "json")
            else { fatalError() }
        do {
            let fileDataStr = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            let fileData = fileDataStr.data(using: String.Encoding.utf8)
            do {
                if dataType == .dictionary {
                    if let dict = try JSONSerialization.jsonObject(with: fileData!, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject] {
                        return dict
                    }
                } else {
                    if let arr = try JSONSerialization.jsonObject(with: fileData!, options: JSONSerialization.ReadingOptions.allowFragments) as? [[String: Any]] {
                        return arr
                    }
                }
            } catch let e as NSError {
                print(e.localizedDescription)
            }
        } catch let e as NSError {
            print(e.localizedDescription)
        }
        return nil
    }
}
