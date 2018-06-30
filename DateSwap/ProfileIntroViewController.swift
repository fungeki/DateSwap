//
//  ProfileIntroViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 21/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ProfileIntroViewController: UIViewController {
    @IBAction func distanceChanged(_ sender: PriceSliderUISlider) {
        let currentValue = Int(sender.value)
        switch currentValue {
        case 301, 302, 303, 304, 305:
            distanceUILabel.text = "Unlimited"
        default:
            distanceUILabel.text = "\(currentValue) KM."
        }
        
        
    }
    @IBOutlet weak var editProfileUIButton: UIButton!
    
    @IBOutlet weak var distanceUILabel: UILabel!

    @IBOutlet weak var distanceUISlider: PriceSliderUISlider!
    
    @IBOutlet weak var profileIntroUIImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    override func viewDidLayoutSubviews() {
        editProfileUIButton.addJeansEffect(color: mediumOrange(), cornerRadius: 15, lineWidth: 2, lineDashPattern: [9,9])
        
        editProfileUIButton.addJeansEffect(color: mediumOrange(), cornerRadius: 15, lineWidth: 2, lineDashPattern: [9,9], position: CGPoint(x: editProfileUIButton.frame.width/2, y: editProfileUIButton.frame.height/2))
        editProfileUIButton.backgroundColor = UIColor(cgColor: lightOrangeOpacity())
        
        editProfileUIButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        editProfileUIButton.layer.cornerRadius = 15
        
        // editProfileUIButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        editProfileUIButton.titleLabel?.textAlignment = .center
        editProfileUIButton.setTitle("Edit Profile\nmore text", for: .normal)
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
