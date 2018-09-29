//
//  SettingsTableViewController.swift
//  DateSwap
//
//  Created by Dor tzemach on 28/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    @IBOutlet weak var notificationProductEditTextfield: ProductEditTextfield!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationProductEditTextfield.layer.cornerRadius = 20
        notificationProductEditTextfield.layer.masksToBounds = true
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
   

}
