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
    
    @IBOutlet weak var wishlistUIButton: ConditionUIButton!
    @IBOutlet weak var shareUIButton: ConditionUIButton!
    var displayProduct = p1
    var thisUser = u1
//    let thumbImageLike = imageResizeForSlider(#imageLiteral(resourceName: "ic_love_color"))
//    let thumbImageDislike = imageResizeForSlider(#imageLiteral(resourceName: "ic_x_color"))
//    let thumbBack = imageResizeForSlider(#imageLiteral(resourceName: "ic_backMatch_color"))
//    @IBOutlet weak var relationUISlider: RelationUISlider!
//    @IBOutlet weak var likeUIImageView: UIImageView!
    @IBOutlet weak var conditionButton: ConditionUIButton!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var userNameUILabel: UILabel!
    
    @IBOutlet weak var userChainsawUIButton: UIButton!
    @IBOutlet weak var userRatingUILabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
//    @IBOutlet weak var dislikeUIImageView: UIImageView!
    @IBOutlet weak var itemPictureImageView: UIImageView!
    @IBOutlet weak var userStallUIButton: UIButton!
    @IBOutlet weak var userProfileImageUIImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        wishlistUIButton.cornerRadius = wishlistUIButton.frame.height / 2
        shareUIButton.cornerRadius = shareUIButton.frame.height / 2
        guard let temp = gItemPlaceholder else {return}
        displayProduct = temp
        itemNameLabel.text = displayProduct.title
        
        itemDescriptionLabel.text = displayProduct.description
        itemDescriptionLabel.numberOfLines = 0
        itemDescriptionLabel .sizeToFit()
        itemImageView.sd_setImage(with: URL(string: displayProduct.image))
        conditionButton.isEnabled = false
        itemImageView.layer.cornerRadius = 20;
        conditionButton.setTitle(returnCondition(displayProduct.condition), for: .disabled)
        
//        relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
//        relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
//        relationUISlider.setThumbImage(thumbBack, for: .normal)
//        relationUISlider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
        retrieveUser()
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
    @IBAction func back(_ sender: Any) {
        if gSwipeState == 0{
            performSegue(withIdentifier: "fromInfoToMarket", sender: nil)
        } else {
            performSegue(withIdentifier: "fromInfoToSwipe", sender: nil)
        }
    }

    @IBAction func addToWishlist(_ sender: Any) {
        pushWish(product: displayProduct, controller: self)
        
    }
    func retrieveUser(){
        let urlString = "http://dateswap.herokuapp.com/getaprofile?id=\(displayProduct.userID)"
        guard let urlObj = URL(string: urlString) else {
            print("failed object url in profile")
            return}
        URLSession.shared.dataTask(with: urlObj) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {return}
                do{
                    let profileSQL = try JSONDecoder().decode([ProfileSQL].self, from: data)
                    if profileSQL.count < 1 {return}
                    gUserProfile = profileSQL2internal(profileSQL: profileSQL[0])
                    guard let temp = gUserProfile else {return}
                    self.thisUser = temp
                    self.userNameUILabel.text = self.thisUser.nickname
                    // print(mProfile)
                    //print(profileSQL)
                    
                    switch self.thisUser.rating {
                    case 1:
                        self.userChainsawUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_one"), for: .normal)
                        break
                    case 1.5:
                        self.userChainsawUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_oneAndaHalf"), for: .normal)
                        break
                    case 2:
                        self.userChainsawUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_two"), for: .normal)
                        break
                    case 2.5:
                        self.userChainsawUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_twoAndaHalf"), for: .normal)
                        break
                    case 3:
                        self.userChainsawUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_threeAndaHalf"), for: .normal)
                        break
                    case 3.5:
                        self.userChainsawUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_threeAndaHalf"), for: .normal)
                        break
                    case 4:
                        self.userChainsawUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_four"), for: .normal)
                        break
                    case 4.5:
                        self.userChainsawUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_fourAndaHalf"), for: .normal)
                        break
                    default:
                        self.userChainsawUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_five"), for: .normal)
                        break
                    }
                    self.userRatingUILabel.text = String(self.thisUser.rating)
                    guard let tempURLImage = URL(string: self.thisUser.pic) else {return}
                    self.userProfileImageUIImageView.sd_setImage(with: tempURLImage)
                    
                }catch {
                    print(error)
                    
                }
            }
            }.resume()
    }
    
    override func viewDidLayoutSubviews() {
        userStallUIButton.addJeansEffect(color: lightOrange(), cornerRadius: 15, lineWidth: 2, lineDashPattern: [9,9], distanceTop: 5,distanceSides: 5)
        
        userProfileImageUIImageView.layer.cornerRadius = userProfileImageUIImageView.frame.height/2
        userProfileImageUIImageView.layer.borderWidth = 3
        userProfileImageUIImageView.layer.borderColor = UIColor.white.cgColor
        
        
    }
    @IBAction func comingSoon(_ sender: Any) {
        popAlert(title: "Coming Soon", message: "stay tuned :)", view: self)
    }
    func moveToMarketWithToast(){
        performSegue(withIdentifier: "fromInfoToMarket", sender: 0)
    }
    
    @IBAction func touserStallAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "toStallSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard sender != nil else {return}
        guard let segueID = segue.identifier else {return}
        if segueID == "toStallSegue" {
        guard let detailsVC =  segue.destination as? ProfileViewController else {return}
        detailsVC.myProfile = self.thisUser
        detailsVC.prevItem = self.displayProduct
    }
        else if segueID == "backToSwipeSegue" {
            guard let backVC = segue.destination as? SwipeToLikeUIViewController else {return}
            backVC.transfer = displayProduct
            
        } else if segueID == "fromInfoToItemSelect"{
            guard let tradingVC = segue.destination as? TradingItemSelectionViewController else {return}
            tradingVC.origin = self
            
        } else if segueID == "fromInfoToMarket" {
            guard let marketVC = segue.destination as? MarketViewController else {return}
            marketVC.showSaveSegue = true
            
        }
}
    
    
    
    
    
//    @objc func onSliderValChanged(slider: UISlider, event: UIEvent) {
//        let sliderPosition: CGFloat = CGFloat(slider.value - 0.5)
//        if let touchEvent = event.allTouches?.first {
//            switch touchEvent.phase {
//            case .began:
//                break
//            // handle drag began
//            case .moved:
//                if slider.value > 0.5{
//                    relationUISlider.maximumTrackTintColor = UIColor(cgColor: darkOrange())
//                    relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
//                    relationUISlider.setThumbImage(thumbImageLike, for: .normal)
//                    likeUIImageView.alpha = CGFloat(slider.value * 1.2)
//                    dislikeUIImageView.alpha = 0
//                    likeUIImageView.transform = CGAffineTransform(scaleX: 1 + sliderPosition * 0.5, y: 1 + sliderPosition * 0.5)
//
//                    //                    if slider.value > 1.048999 {
//                    //                        let newThumbImage = thumbImageLike.resize(size: CGSize(width: 55 * (sliderPosition + 0.3), height: 55 * (sliderPosition + 0.3)))
//                    //                        slider.setThumbImage(newThumbImage, for: .normal)
//                    //                    }
//
//
//                } else if slider.value < 0.5 {
//                    relationUISlider.minimumTrackTintColor = UIColor(cgColor: brown())
//                    relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
//                    relationUISlider.setThumbImage(thumbImageDislike, for: .normal)
//                    dislikeUIImageView.alpha = 1
//                    likeUIImageView.alpha = 0
//
//                    dislikeUIImageView.transform = CGAffineTransform(scaleX: 1 - sliderPosition * 0.5, y: 1 - sliderPosition * 0.5)
//                }
//
//                //                    if slider.value < -0.04999 {
//                //                        let newThumbImage = thumbImageLike.resize(size: CGSize(width: 55 * 0.5, height: 55 * 0.5))
//                //                        slider.setThumbImage(newThumbImage, for: .normal)
//                //                    }
//                //                if slider.value > 0.5{
//                //                    relationUISlider.maximumTrackTintColor = UIColor(cgColor: darkOrange())
//                //                    relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
//                //                    relationUISlider.setThumbImage(thumbImageLike, for: .normal)
//                //                    likeUIImageView.alpha = CGFloat(slider.value * 1.2)
//                //                    dislikeUIImageView.alpha = 0
//                //                } else if slider.value < 0.5 {
//                //                    relationUISlider.minimumTrackTintColor = UIColor(cgColor: brown())
//                //                    relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
//                //                    relationUISlider.setThumbImage(thumbImageDislike, for: .normal)
//                //                    dislikeUIImageView.alpha = CGFloat(1 - slider.value * 1.2)
//                //                    likeUIImageView.alpha = 0
//                //                }
//                break
//            // handle drag moved
//            case .ended:
//                dislikeUIImageView.alpha = 0
//                likeUIImageView.alpha = 0
//                relationUISlider.setThumbImage(thumbBack, for: .normal)
//                UIView.animate(withDuration: 0.3, animations: {
//                    self.relationUISlider.setValue(0.5, animated: true)
//                    self.relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
//                    self.relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
//                })
//                break
//            // handle drag ended
//            default:
//                break
//            }
//        }
    @IBAction func acceptProduct(_ sender: Any) {
        if gOnlineUserProducts[0].userID == 0{
            popAlert(title: "No Items", message: "To barter, please enter an item", view: self)
            
        } else {
            performSegue(withIdentifier: "fromInfoToItemSelect", sender: 0)
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
