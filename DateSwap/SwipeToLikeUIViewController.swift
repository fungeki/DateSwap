//
//  SwipeToLikeUIViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 28/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class SwipeToLikeUIViewController: UIViewController {
    
    
    let thumbImageLike = imageResizeForSlider(#imageLiteral(resourceName: "ic_love_color"))
    let thumbImageDislike = imageResizeForSlider(#imageLiteral(resourceName: "ic_x_color"))
    let thumbBack = imageResizeForSlider(#imageLiteral(resourceName: "ic_backMatch_color"))
    @IBOutlet weak var factionIndicatorUIImage: UIImageView!
    @IBOutlet weak var productCardUIView: ProductCardUIView!
    var displayProduct: Product = p1
    @IBOutlet weak var conditionMainImageUIButton: ConditionUIButton!
 
    @IBOutlet weak var likeUIImageView: UIImageView!
    @IBOutlet weak var dislikeUIImageView: UIImageView!
    
    @IBOutlet weak var relationUISlider: RelationUISlider!
    @IBOutlet weak var mainTitleMainImageUIButton: UILabel!
    
    @IBOutlet weak var mainImageUIImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSlider()
        initialize()
        
        
        
        

        // Do any additional setup after loading the view.
    }

    func initialize(){
        mainImageUIImageView.sd_setImage(with: URL(string: displayProduct.image))
        
        conditionMainImageUIButton.isEnabled = false
        
        mainTitleMainImageUIButton.text = displayProduct.title
        mainTitleMainImageUIButton.textColor = UIColor(cgColor: brown())
        conditionMainImageUIButton.setTitle(returnCondition(displayProduct.condition), for: .disabled)
        conditionMainImageUIButton.bg = UIColor(cgColor: mediumOrange())
        conditionMainImageUIButton.borderColor = UIColor(cgColor: lightOrange())
  
        
    }
    func prepareSlider(){
        relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
        relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
        relationUISlider.setThumbImage(thumbBack, for: .normal)
        relationUISlider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
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
                    factionIndicatorUIImage.alpha = sliderPosition * 2.0
                    factionIndicatorUIImage.image = #imageLiteral(resourceName: "ic_like_date")
                    dislikeUIImageView.alpha = 0
                    likeUIImageView.transform = CGAffineTransform(scaleX: 1 + sliderPosition * 0.5, y: 1 + sliderPosition * 0.5)
                    let translate = CGAffineTransform(translationX: CGFloat(UIScreen.main.bounds.width * sliderPosition * 1.05 ), y: 0)
                    let rotate = CGAffineTransform(rotationAngle: sliderPosition * 0.45)
                    productCardUIView.transform = translate.concatenating(rotate)
//                    if slider.value > 1.048999 {
//                        let newThumbImage = thumbImageLike.resize(size: CGSize(width: 55 * (sliderPosition + 0.3), height: 55 * (sliderPosition + 0.3)))
//                        slider.setThumbImage(newThumbImage, for: .normal)
//                    }
            
                   
                } else if slider.value < 0.5 {
                    relationUISlider.minimumTrackTintColor = UIColor(cgColor: brown())
                    relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
                    relationUISlider.setThumbImage(thumbImageDislike, for: .normal)
                    dislikeUIImageView.alpha = 1
                    factionIndicatorUIImage.alpha = sliderPosition * 2.0
                    likeUIImageView.alpha = 0
                    factionIndicatorUIImage.image = #imageLiteral(resourceName: "ic_no_like_date")
                    dislikeUIImageView.transform = CGAffineTransform(scaleX: 1 - sliderPosition * 0.5, y: 1 - sliderPosition * 0.5)
                    factionIndicatorUIImage.alpha = CGFloat(1.0 - slider.value * 1.05)
                    let translate = CGAffineTransform(translationX: CGFloat(UIScreen.main.bounds.width * sliderPosition * 1.05 ), y: 0)
                    let rotate = CGAffineTransform(rotationAngle: sliderPosition * 0.45)
                    productCardUIView.transform = translate.concatenating(rotate)
//                    if slider.value < -0.04999 {
//                        let newThumbImage = thumbImageLike.resize(size: CGSize(width: 55 * 0.5, height: 55 * 0.5))
//                        slider.setThumbImage(newThumbImage, for: .normal)
//                    }
                    
                }
                break
            // handle drag moved
            case .ended:
                dislikeUIImageView.alpha = 0
                likeUIImageView.alpha = 0
                relationUISlider.setThumbImage(thumbBack, for: .normal)
                UIView.animate(withDuration: 0.3, animations: {
                    self.relationUISlider.setValue(0.5, animated: true)
                    self.factionIndicatorUIImage.alpha = 0
                    self.relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
                    self.relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
                    self.productCardUIView.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.likeUIImageView.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.dislikeUIImageView.transform = CGAffineTransform(translationX: 0, y: 0)
                  
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
    override func viewDidLayoutSubviews() {
        mainImageUIImageView.layer.cornerRadius = productCardUIView.cornerRadius
    }
    
    
    
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        let percOff = abs(xFromCenter) / view.center.x
        
        if xFromCenter < 0.0{
            factionIndicatorUIImage.image = #imageLiteral(resourceName: "ic_no_like_date")
           // relationUISlider.setValue(Float(0.5 - percOff * 0.9), animated: false)
        }
        else{
           // relationUISlider.maximumTrackTintColor = UIColor(cgColor: darkOrange())
         //   relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
            factionIndicatorUIImage.image = #imageLiteral(resourceName: "ic_like_date")
          //  relationUISlider.setValue(Float(0.9 * percOff + 0.5), animated: true)
           //relationUISlider.setThumbImage(thumbImageLike, for: .disabled)
        }
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        card.transform = CGAffineTransform(rotationAngle: 0.45 * xFromCenter / view.center.x)
        factionIndicatorUIImage.alpha = percOff
        if percOff > 0.7{
            sender.isEnabled = false
//            UIView.animate(withDuration: 0.3, animations: {
//                self.productCardUIView.alpha = 0
//                if xFromCenter > 0 {
//                    UIView.animate(withDuration: 0.2, animations: {
//                        card.center = CGPoint(x: card.center.x + 100, y: card.center.y)
//                    })
//                } else {
//                    UIView.animate(withDuration: 0.2, animations: {
//                        card.center = CGPoint(x: card.center.x - 100, y: card.center.y)
//                    })
//                }
//            }, completion: {(true) in
//
//            })

            UIView.animate(withDuration: 0.3, delay: 0, options: .allowAnimatedContent, animations: {
                card.alpha = -2
                if xFromCenter > 0 {
                    card.center = CGPoint(x: card.center.x + 150, y: card.center.y)
                } else {
                    card.center = CGPoint(x: card.center.x - 150, y: card.center.y)
                }
            }, completion: { (true) in
                card.transform = CGAffineTransform(rotationAngle: 0)
                self.factionIndicatorUIImage.alpha = 0
                card.center.x = self.view.center.x
                card.center.y = self.view.center.y
                sender.isEnabled = false
                self.displayProduct = p2
                self.relationUISlider.setValue(0.5, animated: true)
                self.initialize()
                UIView.animate(withDuration: 0.2, animations: {
                    card.alpha = 1
                    sender.isEnabled = true
                }
                )
            })

            
        }
        
        
        //let go
        if sender.state == UIGestureRecognizerState.ended{
            relationUISlider.isEnabled = true
            UIView.animate(withDuration: 0.1, animations: {
                card.transform = CGAffineTransform(rotationAngle: 0)
            })
            UIView.animate(withDuration: 0.3, animations: {
                self.factionIndicatorUIImage.alpha = 0
                self.relationUISlider.setValue(0.5, animated: true)
                
            })
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 4, options: .curveLinear, animations: {
            card.center = self.view.center
            
        })
    }
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
