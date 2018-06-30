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

    @IBOutlet weak var relationUISlider: RelationUISlider!
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
        itemDescriptionLabel .sizeToFit()
        itemImageView.sd_setImage(with: URL(string: p1.image))
        conditionButton.isEnabled = false
        itemImageView.layer.cornerRadius = 20;
        conditionButton.setTitle(returnCondition(p1.condition), for: .disabled)
    
        relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
        relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
        relationUISlider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func onSliderValChanged(slider: UISlider, event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
            case .began:
                break
            // handle drag began
            case .moved:
                if slider.value > 0.5{
                    relationUISlider.maximumTrackTintColor = UIColor(cgColor: darkOrange())
                    relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
                    
                    
                } else if slider.value < 0.5 {
                    relationUISlider.minimumTrackTintColor = UIColor(cgColor: brown())
                    relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
                }
                break
            // handle drag moved
            case .ended:
                UIView.animate(withDuration: 0.3, animations: {
                    self.relationUISlider.setValue(0.5, animated: true)
                    self.relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
                    self.relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
                })
                break
            // handle drag ended
            default:
                break
            }
        }
    }

    @IBAction func slidingRelationValueChange(_ sender: RelationUISlider) {
        
//        if sender.value > 0.5{
//            relationUISlider.maximumTrackTintColor = UIColor(cgColor: darkOrange())
//            relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
//
//
//        } else if sender.value < 0.5 {
//            relationUISlider.minimumTrackTintColor = UIColor(cgColor: brown())
//            relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
//        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

