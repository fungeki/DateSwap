//
//  ProfileIntroViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 21/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ProfileIntroViewController: UIViewController {

    @IBAction func postChange(_ sender: priceUISlider) {
        let currentValue = Int(sender.value)
        switch currentValue {
        case 301, 302, 303, 304, 305:
            distanceUILabel.text = "Unlimited"
        default:
            distanceUILabel.text = "\(currentValue) KM."
        }
//        if currentValue > 300 (
//            distanceUILabel.text = "Unlimited"
//            ) else {
//        distanceUILabel.text = "\(currentValue) KM."
//        }
    }
    @IBOutlet weak var distanceUILabel: UILabel!
    @IBOutlet weak var distanceUISlider: priceUISlider!
    @IBOutlet weak var profileIntroUIImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        profileIntroUIImageView.layer.cornerRadius = profileIntroUIImageView.frame.height/2
        
    }
    

    override func viewDidLayoutSubviews() {
        profileIntroUIImageView.layer.cornerRadius = profileIntroUIImageView.frame.height/2
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
