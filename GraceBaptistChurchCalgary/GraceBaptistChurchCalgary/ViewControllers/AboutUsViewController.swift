//
//  AboutUsViewController.swift
//  GraceBaptistChurchCalgary
//
//  Created by Dinesh Thangasamy on 2017-12-15.
//  Copyright © 2017 GBCCalgary. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var sections = [String]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AboutUs.fetchData({(err) in
            guard err == nil else {
                print("Error \(err!)")
                return
            }
            self.sections = AboutUs.shared.sections
            print(AboutUs.shared)
            DispatchQueue.main.async() {
                self.tableView.reloadData()
            }
        })
    }
    
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutUsCategoryCells", for: indexPath)
        cell.textLabel?.text = self.sections[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (UI_USER_INTERFACE_IDIOM() == .phone){
            performSegue(withIdentifier: "presentDetail", sender: self)
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            if let splitViewController = self.splitViewController, splitViewController.viewControllers.count > 1 {
                if let detailVC = self.splitViewController?.viewControllers[1] as? DetailViewController {
                    detailVC.data = [String: Any]()
                }
            } else {
                performSegue(withIdentifier: "presentDetail", sender: self)
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "presentDetail" {
            let controller = segue.destination as! DetailViewController
            if let indexPath = self.tableView.indexPathForSelectedRow {
                controller.data = [String: Any]()
            } else {
                print("Something went wrong")
            }
        }
    }
}
