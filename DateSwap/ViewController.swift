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
   
    
    let thumbImageLike = imageResizeForSlider(#imageLiteral(resourceName: "ic_love_color"))
    let thumbImageDislike = imageResizeForSlider(#imageLiteral(resourceName: "ic_x_color"))
    let thumbBack = imageResizeForSlider(#imageLiteral(resourceName: "ic_backMatch_color"))
    @IBOutlet weak var relationUISlider: RelationUISlider!
    @IBOutlet weak var likeUIImageView: UIImageView!
    @IBOutlet weak var conditionButton: ConditionUIButton!
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var dislikeUIImageView: UIImageView!
    @IBOutlet weak var itemPictureImageView: UIImageView!
    @IBOutlet weak var userStallUIButton: UIButton!
    @IBOutlet weak var userProfileImageUIImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        itemNameLabel.text = p1.title
        
        itemDescriptionLabel.text = p1.description
        itemDescriptionLabel.numberOfLines = 0
        itemDescriptionLabel .sizeToFit()
        itemImageView.sd_setImage(with: URL(string: p1.image))
        conditionButton.isEnabled = false
        itemImageView.layer.cornerRadius = 20;
        conditionButton.setTitle(returnCondition(p1.condition), for: .disabled)
        
        relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
        relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
        relationUISlider.setThumbImage(thumbBack, for: .normal)
        relationUISlider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
    
        //        let thumbSize = CGRect(x: 0, y: 0, width: 24, height: 24)
        //        var thumbImage = #imageLiteral(resourceName: "ic_backMatch_color")
        //
        //        relationUISlider.setThumbImage(thumbImage, for: .normal)
        
        //        let centerPoint = CGPoint(x: relationUISlider.frame.midX, y: relationUISlider.frame.midY)
        //        relationUISlider.thumbImage(for: .normal)?.draw(in: CGRect(origin: centerPoint, size: CGSize(width: 4, height: 4)))//       relationUISlider.setThumbImage(#imageLiteral(resourceName: "ic_backMatch_color"), for: .normal)
        //
        //        var thumbImage : UIImage = #imageLiteral(resourceName: "ic_backMatch_color")
        
        
        // Do any additional setup after loading the view, typically from a nib.
        userStallUIButton.backgroundColor = UIColor(cgColor: mediumOrange())
        userStallUIButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        userStallUIButton.layer.cornerRadius = 15
    }
    
    override func viewDidLayoutSubviews() {
        userStallUIButton.addJeansEffect(color: lightOrange(), cornerRadius: 15, lineWidth: 2, lineDashPattern: [9,9], distanceTop: 5,distanceSides: 5)
        
        userProfileImageUIImageView.layer.cornerRadius = userProfileImageUIImageView.frame.height/2
        userProfileImageUIImageView.layer.borderWidth = 3
        userProfileImageUIImageView.layer.borderColor = UIColor.white.cgColor
        
        
    }
    
    @objc func onSliderValChanged(slider: UISlider, event: UIEvent) {
        let sliderPosition: CGFloat = CGFloat(slider.value - 0.5)
        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
            case .began:
                break
            // handle drag began
            case .moved:
                if slider.value > 0.5{
                    relationUISlider.maximumTrackTintColor = UIColor(cgColor: darkOrange())
                    relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
                    relationUISlider.setThumbImage(thumbImageLike, for: .normal)
                    likeUIImageView.alpha = CGFloat(slider.value * 1.2)
                    dislikeUIImageView.alpha = 0
                    likeUIImageView.transform = CGAffineTransform(scaleX: 1 + sliderPosition * 0.5, y: 1 + sliderPosition * 0.5)
                    
                    //                    if slider.value > 1.048999 {
                    //                        let newThumbImage = thumbImageLike.resize(size: CGSize(width: 55 * (sliderPosition + 0.3), height: 55 * (sliderPosition + 0.3)))
                    //                        slider.setThumbImage(newThumbImage, for: .normal)
                    //                    }
                    
                    
                } else if slider.value < 0.5 {
                    relationUISlider.minimumTrackTintColor = UIColor(cgColor: brown())
                    relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
                    relationUISlider.setThumbImage(thumbImageDislike, for: .normal)
                    dislikeUIImageView.alpha = 1
                    likeUIImageView.alpha = 0
                    
                    dislikeUIImageView.transform = CGAffineTransform(scaleX: 1 - sliderPosition * 0.5, y: 1 - sliderPosition * 0.5)
                }
                
                //                    if slider.value < -0.04999 {
                //                        let newThumbImage = thumbImageLike.resize(size: CGSize(width: 55 * 0.5, height: 55 * 0.5))
                //                        slider.setThumbImage(newThumbImage, for: .normal)
                //                    }
                //                if slider.value > 0.5{
                //                    relationUISlider.maximumTrackTintColor = UIColor(cgColor: darkOrange())
                //                    relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
                //                    relationUISlider.setThumbImage(thumbImageLike, for: .normal)
                //                    likeUIImageView.alpha = CGFloat(slider.value * 1.2)
                //                    dislikeUIImageView.alpha = 0
                //                } else if slider.value < 0.5 {
                //                    relationUISlider.minimumTrackTintColor = UIColor(cgColor: brown())
                //                    relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
                //                    relationUISlider.setThumbImage(thumbImageDislike, for: .normal)
                //                    dislikeUIImageView.alpha = CGFloat(1 - slider.value * 1.2)
                //                    likeUIImageView.alpha = 0
                //                }
                break
            // handle drag moved
            case .ended:
                dislikeUIImageView.alpha = 0
                likeUIImageView.alpha = 0
                relationUISlider.setThumbImage(thumbBack, for: .normal)
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
