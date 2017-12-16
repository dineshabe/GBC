//
//  HomeViewController.swift
//  GraceBaptistChurchCalgary
//
//  Created by Dinesh Thangasamy on 2017-12-13.
//  Copyright © 2017 GBCCalgary. All rights reserved.
//

import UIKit
import WebKit

class HomeViewController: UIViewController {
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var webContainer: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        Church.fetchData({(err) in
            guard err == nil else {
                print("Error \(err!)")
                return
            }
            DispatchQueue.main.async() {
                self.webContainer.load(URLRequest(url: URL(string: Church.shared.facebookUrl)!))
            }
        })
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
