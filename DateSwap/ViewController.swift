//
//  ViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 08/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit
import SDWebImage
class ViewController: UIViewController {

    @IBOutlet weak var conditionButton: ConditionUIButton!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemAreaLabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var itemPictureImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        itemNameLabel.text = p1.title
        itemAreaLabel.text = p1.area
        itemDescriptionLabel.text = p1.description
        itemDescriptionLabel.numberOfLines = 0
        [itemDescriptionLabel .sizeToFit()]
        itemImageView.sd_setImage(with: URL(string: p1.image))
        conditionButton.isEnabled = false
        itemImageView.layer.cornerRadius = 20;
        conditionButton.setTitle(returnCondition(p1.condition), for: .disabled)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

