//
//  HomeViewController.swift
//  GraceBaptistChurchCalgary
//
//  Created by Dinesh Thangasamy on 2017-12-13.
//  Copyright © 2017 GBCCalgary. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let dict = FileUtils().getJsonData("home") as? [String: AnyObject] {
            print(dict)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func callTapped() {
        
    }

    @IBAction func emailTapped() {
        
    }
    
    @IBAction func directionsTapped() {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
