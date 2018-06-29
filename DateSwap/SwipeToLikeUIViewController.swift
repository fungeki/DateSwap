//
//  SwipeToLikeUIViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 28/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class SwipeToLikeUIViewController: UIViewController {
    @IBOutlet weak var factionIndicatorUIImage: UIImageView!
    @IBOutlet weak var productCardUIView: ProductCardUIView!
    var displayProduct: Product = p1
    @IBOutlet weak var conditionMainImageUIButton: ConditionUIButton!
    
    @IBOutlet weak var mainTitleMainImageUIButton: UILabel!
    
    @IBOutlet weak var mainImageUIImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        
        
        
        

        // Do any additional setup after loading the view.
    }

    func initialize(){
        mainImageUIImageView.sd_setImage(with: URL(string: displayProduct.image))
        
        conditionMainImageUIButton.isEnabled = false
        
        mainTitleMainImageUIButton.text = displayProduct.title
        conditionMainImageUIButton.setTitle(returnCondition(displayProduct.condition), for: .disabled)
        conditionMainImageUIButton.bg = UIColor(cgColor: mediumOrange())
        conditionMainImageUIButton.borderColor = UIColor(cgColor: lightOrange())
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
            factionIndicatorUIImage.tintColor = UIColor.red
        }
        else{
            factionIndicatorUIImage.image = #imageLiteral(resourceName: "ic_like_date")
            factionIndicatorUIImage.tintColor = UIColor.green
        }
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        card.transform = CGAffineTransform(rotationAngle: 0.7 * xFromCenter / view.center.x)
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
            UIView.animate(withDuration: 0.1, animations: {
                card.transform = CGAffineTransform(rotationAngle: 0)
            })
            UIView.animate(withDuration: 0.3, animations: {
                self.factionIndicatorUIImage.alpha = 0
                
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
