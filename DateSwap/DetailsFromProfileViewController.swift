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
    
    @IBOutlet weak var dislikeUIImageView: UIImageView!
    @IBOutlet weak var likeUIImageView: UIImageView!
    @IBOutlet weak var itemDesicriptionDetailLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    let thumbImageLike = imageResizeForSlider(#imageLiteral(resourceName: "ic_love_color"))
    let thumbImageDislike = imageResizeForSlider(#imageLiteral(resourceName: "ic_x_color"))
    let thumbBack = imageResizeForSlider(#imageLiteral(resourceName: "ic_backMatch_color"))
    
    @IBOutlet weak var relationUISlider: RelationUISlider!
    
    
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
        relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
        relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
        relationUISlider.setThumbImage(thumbBack, for: .normal)
        relationUISlider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
        // Do any additional setup after loading the view.
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
