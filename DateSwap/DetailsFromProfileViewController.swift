//
//  DetailsFromProfileViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 14/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class DetailsFromProfileViewController: UIViewController {
    @IBOutlet weak var contButton: ConditionUIButton!
    
    @IBOutlet weak var itemDesicriptionDetailLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    var product: Product!
    override func viewDidLoad() {
        super.viewDidLoad()
        itemDesicriptionDetailLabel.text = product.description
        itemImageView.sd_setImage(with: URL(string: product.image))
        itemNameLabel.text = product.title
        itemDesicriptionDetailLabel.numberOfLines = 0
        itemDesicriptionDetailLabel .sizeToFit()
        itemImageView.layer.cornerRadius = 20
        contButton.isEnabled = false
        contButton.setTitle(returnCondition(product.condition), for: .disabled)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
