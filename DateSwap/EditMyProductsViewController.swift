//
//  EditMyProductsViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 21/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class EditMyProductsViewController: UIViewController {

    @IBOutlet weak var addANewPhotoUIButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    var product: Product?
    var pageHeader: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = pageHeader
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        addANewPhotoUIButton.addJeansEffect(UIColor.orange.cgColor)
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
