//
//  SwipeToLikeUIViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 28/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class SwipeToLikeUIViewController: UIViewController {
    
    var transfer : Product?
    var mItemPicked: Product?
    var displayProducts = [Product]()
    var currentProduct = 0
    var display = p4
  //  var skipped = false
//    let thumbImageLike = imageResizeForSlider(#imageLiteral(resourceName: "ic_love_color"))
//    let thumbImageDislike = imageResizeForSlider( #imageLiteral(resourceName: "ic_x_color"))
//    let thumbBack = imageResizeForSlider( #imageLiteral(resourceName: "ic_backMatch_color"))


    @IBOutlet weak var selectItemUIButton: UIButton!
    @IBOutlet weak var myItemNameUIButton: UIButton!

    @IBOutlet weak var myItemImageUIButton: UIButton!
    @IBOutlet weak var factionIndicatorUIImage: UIImageView!
    @IBOutlet var generalView: UIView!
    @IBOutlet weak var productCardUIView: ProductCardUIView!
    @IBOutlet weak var conditionMainImageUIButton: ConditionUIButton!
    @IBOutlet weak var nextProductUIImage: UIImageView!
    
//    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var nextCardUIcard: UIView!
//    @IBOutlet weak var relationUISlider: RelationUISlider!
//    @IBOutlet weak var likeUIImageView: UIImageView!
//    
//    @IBOutlet weak var dislikeUIImageView: UIImageView!
    @IBOutlet weak var mainTitleMainImageUIButton: UILabel!
    
    @IBOutlet weak var mainImageUIImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        JustHUD.shared.showInView(view: generalView, withHeader: "Loading", andFooter: "One Moment")
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "activeProduct"), object: nil, queue: OperationQueue.main) { (notification) in
            self.displayActiveProduct()
        }
        displayActiveProduct()
        selectItemUIButton.layer.cornerRadius = selectItemUIButton.frame.height / 2
        myItemImageUIButton.layer.cornerRadius = myItemImageUIButton.frame.height / 2
        myItemNameUIButton.contentHorizontalAlignment = .left
        generalView.isUserInteractionEnabled = false
        nextProductUIImage.layer.cornerRadius = 20
        if let mTransfer = transfer {
            mainImageUIImageView.sd_setImage(with: URL(string: mTransfer.image))
        }
        getProduct()
//        prepareSlider()
        mainTitleMainImageUIButton.numberOfLines = 0
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SwipeToLikeUIViewController.myviewTapped(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        self.mainImageUIImageView.isUserInteractionEnabled = true
        self.mainImageUIImageView.addGestureRecognizer(tapGesture)
        
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC =  segue.destination as? ViewController else {return}
        // detailsVC.displayProduct = sender as! Product
        gItemPlaceholder = sender as? Product
    }
    
    func displayActiveProduct(){
        print(gActiveProduct)
        if gActiveProduct.ID != 0 {
            myItemImageUIButton.sd_setImage(with: URL(string: gActiveProduct.image), for: .normal, completed: { (img, err, cache, url) in
                JustHUD.shared.hide()
            })
            myItemNameUIButton.setTitle(gActiveProduct.title, for: .normal)
            
        } else{
            myItemNameUIButton.setTitle("Please Select what to barter", for: .normal)
        }
    }
    
    func getProduct(){
        let url = "http://dateswap.herokuapp.com/productsdb"
        guard let urlObj = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: urlObj) { (data, response, ic_user) in
            DispatchQueue.main.async {
                
                
                guard let data = data else {return}

                do{
                    let mProducts = try JSONDecoder().decode([ProductExpSQL].self, from: data)
                    self.displayProducts = arrayProductsSQL2Local(array: mProducts)
                    self.display = self.displayProducts[0]
                    if let isPicked = gItemPlaceholder {
                        self.mainImageUIImageView.sd_setImage(with: URL(string: self.displayProducts[0].image))
                        self.displayProducts.insert(isPicked, at: self.displayProducts.startIndex)
                        self.productCardUIView.layer.zPosition = .greatestFiniteMagnitude
                        self.initialize()
                        if JustHUD.shared.isActive{
                            JustHUD.shared.hide()
                        }
                        self.generalView.isUserInteractionEnabled = true
                        
                        return
                    }
                    self.initialize()
                    var tempProdNum = 1
                    if tempProdNum > self.displayProducts.count{
                        tempProdNum = 0
                    }
                    let display2 = self.displayProducts[tempProdNum]
                    self.nextProductUIImage.sd_setImage(with: URL(string: display2.image))
                    self.generalView.isUserInteractionEnabled = true
                    JustHUD.shared.hide()
                }catch {
                    print(error)
                }
            }
            }.resume()
    }
    
    /*
     When the user swipes the card, perOff shoots off twice,
     hence a flag exists, so that initialize would happen only once.
     
     */
    func initialize(){
      //  skipped = !skipped
      //  if !skipped {return}
        if currentProduct == displayProducts.count{
            currentProduct = 0
        }
        display = displayProducts[currentProduct]
        gItemPlaceholder = displayProducts[currentProduct]
        
        conditionMainImageUIButton.isEnabled = false
        
        mainTitleMainImageUIButton.text = display.title
        mainTitleMainImageUIButton.textColor = UIColor(cgColor: brown())
        conditionMainImageUIButton.setTitle(returnCondition(display.condition), for: .disabled)
        conditionMainImageUIButton.bg = UIColor(cgColor: mediumOrange())
        conditionMainImageUIButton.borderColor = UIColor(cgColor: lightOrange())
        mainImageUIImageView.sd_setImage(with: URL(string: display.image)) { (nil, err, type, your) in
            self.currentProduct += 1
            
        
        }
       
        
        
        
    }
    
    @objc func myviewTapped(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "detailsSegue", sender: display)
    }
    
//    func prepareSlider(){
//        relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
//        relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
//        relationUISlider.setThumbImage(thumbBack, for: .normal)
//        relationUISlider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        mainImageUIImageView.layer.cornerRadius = productCardUIView.cornerRadius
    }
    
    
    var direction = 0
    var didGo = true
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        let percOff = abs(xFromCenter) / view.center.x
        
//        productCardUIView.layer.zPosition = .greatestFiniteMagnitude
        if xFromCenter < 0.0{
            factionIndicatorUIImage.image = #imageLiteral(resourceName: "ic_no_like_date")
           
        }
        else{
           
            
            factionIndicatorUIImage.image = #imageLiteral(resourceName: "ic_like_date")

        }
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        card.transform = CGAffineTransform(rotationAngle: 0.45 * xFromCenter / view.center.x)
        factionIndicatorUIImage.alpha = percOff * 3
        
        
        //let go
        if sender.state == UIGestureRecognizerState.ended{
            //            if self.toInit{
            //                            let next = self.currentProduct + 1
            //                            if next >= self.displayProducts.count {
            //                                self.currentProduct = 0
            //                            } else {
            //                                self.currentProduct = next
            //                            }
            //            }
            if percOff > 0.333{
                sender.isEnabled = false
                
                
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
                    
//                    self.relationUISlider.setValue(0.5, animated: true)
                    
                    self.initialize()
                    UIView.animate(withDuration: 0.2, animations: {
                        card.alpha = 1
                        sender.isEnabled = true
                    }, completion: { (true) in
                      // self.initialize()
                        var tempProdNum = self.currentProduct
                        if tempProdNum == self.displayProducts.count{
                            tempProdNum = 0
                        }
                        let display2 = self.displayProducts[tempProdNum]
                        self.nextProductUIImage.sd_setImage(with: URL(string: display2.image))
                    })
//                    UIView.animate(withDuration: 0.2, animations: {
//                        card.alpha = 1
//                        sender.isEnabled = true
//                    }
                })
                
                
            } else {
//            self.productCardUIView.layer.zPosition = .leastNormalMagnitude
//            relationUISlider.isEnabled = true
            UIView.animate(withDuration: 0.1, animations: {
                card.transform = CGAffineTransform(rotationAngle: 0)
            })
            UIView.animate(withDuration: 0.3, animations: {
                self.factionIndicatorUIImage.alpha = 0
//                self.relationUISlider.setValue(0.5, animated: true)
                
            })
                
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 4, options: .curveLinear, animations: {
                self.productCardUIView.center = self.nextCardUIcard.center
            
                })
                
        }
        }
        
    }
}

//             relationUISlider.setValue(Float(0.5 - percOff * 0.9), animated: false)

//            if self.direction >= 0 && didGo{
//                self.direction = -1
//                    self.didGo = false
//                    self.likeUIImageView.alpha = 0
//                    self.dislikeUIImageView.alpha = 1
//                    self.relationUISlider.minimumTrackTintColor = UIColor(cgColor: brown())
//                    self.relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
//                    self.relationUISlider.setThumbImage(self.thumbImageLike, for: .normal)
//
//            }
// relationUISlider.setValue(Float(0.5 - percOff * 0.9), animated: false)

// relationUISlider.maximumTrackTintColor = UIColor(cgColor: darkOrange())
//   relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
//                self.relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
//                self.relationUISlider.maximumTrackTintColor = UIColor(cgColor: darkOrange())
//                self.relationUISlider.setValue(Float(0.9 * percOff + 0.5), animated: false)
//            })
//            let dataAsString = String(data: data, encoding: .utf8)
//
//            print("\(dataAsString) my data!!!!!!!!!!!!!!!")
//                UIView.animate(withDuration: 0.2, animations: {
//                                        card.alpha = 1
//                                        sender.isEnabled = true
//                }, completion: { (true) in
//
//                })
//             relationUISlider.setValue(Float(percOff * 0.9 + 0.5), animated: false)
//            if self.direction <= 0 {
//                self.direction = 1
//                DispatchQueue.main.async {
//                    if percOff > 0.05{
//                self.didGo = true
//                    }
//                self.likeUIImageView.alpha = 1
//                self.relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
//                self.relationUISlider.maximumTrackTintColor = UIColor(cgColor: darkOrange())
//                self.relationUISlider.setThumbImage(self.thumbImageLike, for: .normal)
//                }
//            }
//  relationUISlider.setValue(Float(0.9 * percOff + 0.5), animated: true)
//relationUISlider.setThumbImage(thumbImageLike, for: .disabled)
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
//                let next = self.currentProduct + 1
//                if next >= self.displayProducts.count {
// //                   self.currentProduct = 0
//                } else {
//                    self.currentProduct = next
//                }
//                self.initialize()

//                let next = self.currentProduct + 1
//                if next >= self.displayProducts.count {
//                    self.currentProduct = 0
//                } else {
//                    self.initialize()
//                }
//                UIView.animate(withDuration: 0.2, animations: {
//                                        card.alpha = 1
//                                        sender.isEnabled = true
//                }, completion: { (true) in
//
//                })
//    @objc func onSliderValChanged(slider: UISlider, event: UIEvent) {
//
//
//        let sliderPosition: CGFloat = CGFloat(slider.value - 0.5)
//        if let touchEvent = event.allTouches?.first {
//            switch touchEvent.phase {
//            case .began:
//
//                break
//            // handle drag began
//            case .moved:
//
//                if slider.value > 0.5{
//                    relationUISlider.maximumTrackTintColor = UIColor(cgColor: darkOrange())
//                    relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
//                    relationUISlider.setThumbImage(thumbImageLike, for: .normal)
//                    likeUIImageView.alpha = CGFloat(slider.value * 1.2)
//                    factionIndicatorUIImage.alpha = sliderPosition * 2.0
//                    factionIndicatorUIImage.image = #imageLiteral(resourceName: "ic_like_date")
//                    dislikeUIImageView.alpha = 0
//                    likeUIImageView.transform = CGAffineTransform(scaleX: 1 + sliderPosition * 0.5, y: 1 + sliderPosition * 0.5)
//                    let translate = CGAffineTransform(translationX: CGFloat(UIScreen.main.bounds.width * sliderPosition * 1.05 ), y: 0)
//                    let rotate = CGAffineTransform(rotationAngle: sliderPosition * 0.45)
//                    productCardUIView.transform = translate.concatenating(rotate)
//                    if slider.value > 1.03{
//                        UIApplication.shared.beginIgnoringInteractionEvents()
//                        self.relationUISlider.isEnabled = false
//                        self.view.isUserInteractionEnabled = false
//                        self.dislikeUIImageView.alpha = 0
//                        self.likeUIImageView.alpha = 0
//                        self.relationUISlider.setThumbImage(thumbBack, for: .normal)
//                        UIView.animate(withDuration: 0.3, delay: 0, options: .allowAnimatedContent, animations: {
//
//                            self.relationUISlider.setValue(0.5, animated: true)
//                            self.factionIndicatorUIImage.alpha = 0
//                            self.relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
//                            self.relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
//                            self.productCardUIView.transform = CGAffineTransform(translationX: 0, y: 0)
//                            self.likeUIImageView.transform = CGAffineTransform(translationX: 0, y: 0)
//                            self.dislikeUIImageView.transform = CGAffineTransform(translationX: 0, y: 0)
//                            self.productCardUIView.alpha = -2
//                            self.productCardUIView.center = CGPoint(x: self.productCardUIView.center.x + 150, y: self.productCardUIView.center.y)
//                        }, completion: { (true) in
//                            self.relationUISlider.isEnabled = true
//                            self.productCardUIView.transform = CGAffineTransform(rotationAngle: 0)
//                            self.factionIndicatorUIImage.alpha = 0
//                            self.productCardUIView.center.x = self.view.center.x
//                            self.productCardUIView.center.y = self.view.center.y
//                            self.relationUISlider.setValue(0.5, animated: true)
//                      //      self.skipped = !self.skipped
//                            self.initialize()
//                            UIView.animate(withDuration: 0.2, animations: {
//                                self.productCardUIView.alpha = 1
//                            }, completion: {(true) in
//                                UIApplication.shared.endIgnoringInteractionEvents()
//                                self.view.isUserInteractionEnabled = true
//                            }
//                            )
//
//                        })
//                    }
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
//                    factionIndicatorUIImage.alpha = sliderPosition * 2.0
//                    likeUIImageView.alpha = 0
//                    factionIndicatorUIImage.image = #imageLiteral(resourceName: "ic_no_like_date")
//                    dislikeUIImageView.transform = CGAffineTransform(scaleX: 1 - sliderPosition * 0.5, y: 1 - sliderPosition * 0.5)
//                    factionIndicatorUIImage.alpha = CGFloat(1.0 - slider.value * 1.05)
//                    let translate = CGAffineTransform(translationX: CGFloat(UIScreen.main.bounds.width * sliderPosition * 1.05 ), y: 0)
//                    let rotate = CGAffineTransform(rotationAngle: sliderPosition * 0.45)
//                    productCardUIView.transform = translate.concatenating(rotate)
//                    //                    if slider.value < -0.04999 {
//                    //                        let newThumbImage = thumbImageLike.resize(size: CGSize(width: 55 * 0.5, height: 55 * 0.5))
//                    //                        slider.setThumbImage(newThumbImage, for: .normal)
//                    //                    }
//                    if slider.value < -0.03{
//                        UIApplication.shared.beginIgnoringInteractionEvents()
//                        self.relationUISlider.isEnabled = false
//                        self.view.isUserInteractionEnabled = false
//                        self.dislikeUIImageView.alpha = 0
//                        self.likeUIImageView.alpha = 0
//                        self.relationUISlider.setThumbImage(thumbBack, for: .normal)
//                        UIView.animate(withDuration: 0.3, delay: 0, options: .allowAnimatedContent, animations: {
//
//                            self.relationUISlider.setValue(0.5, animated: true)
//                            self.factionIndicatorUIImage.alpha = 0
//                            self.relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
//                            self.relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
//                            self.productCardUIView.transform = CGAffineTransform(translationX: 0, y: 0)
//                            self.likeUIImageView.transform = CGAffineTransform(translationX: 0, y: 0)
//                            self.dislikeUIImageView.transform = CGAffineTransform(translationX: 0, y: 0)
//                            self.productCardUIView.alpha = -2
//                            self.productCardUIView.center = CGPoint(x: self.productCardUIView.center.x - 150, y: self.productCardUIView.center.y)
//                        }, completion: { (true) in
//                            self.relationUISlider.isEnabled = true
//                            self.productCardUIView.transform = CGAffineTransform(rotationAngle: 0)
//                            self.factionIndicatorUIImage.alpha = 0
//                            self.productCardUIView.center.x = self.view.center.x
//                            self.productCardUIView.center.y = self.view.center.y
//                            self.relationUISlider.setValue(0.5, animated: true)
//                     //       self.skipped = !self.skipped
//                            self.initialize()
//                            UIView.animate(withDuration: 0.2, animations: {
//                                self.productCardUIView.alpha = 1
//                            }, completion: {(true) in
//                                UIApplication.shared.endIgnoringInteractionEvents()
//                                self.view.isUserInteractionEnabled = true
//                            }
//                            )
//                            //                UIView.animate(withDuration: 0.2, animations: {
//                            //                                        card.alpha = 1
//                            //                                        sender.isEnabled = true
//                            //                }, completion: { (true) in
//                            //
//                            //                })
//                        })
//                    }
//                }
//                break
//            // handle drag moved
//            case .ended:
//                dislikeUIImageView.alpha = 0
//                likeUIImageView.alpha = 0
//                relationUISlider.setThumbImage(thumbBack, for: .normal)
//                UIView.animate(withDuration: 0.3, animations: {
//
//                    self.relationUISlider.setValue(0.5, animated: true)
//                    self.factionIndicatorUIImage.alpha = 0
//                    self.relationUISlider.maximumTrackTintColor = UIColor(cgColor: grayFour())
//                    self.relationUISlider.minimumTrackTintColor = UIColor(cgColor: grayFour())
//                    self.productCardUIView.transform = CGAffineTransform(translationX: 0, y: 0)
//                    self.likeUIImageView.transform = CGAffineTransform(translationX: 0, y: 0)
//                    self.dislikeUIImageView.transform = CGAffineTransform(translationX: 0, y: 0)
//
//                })
//                break
//            // handle drag ended
//            default:
//                break
//            }
//        }
//    }
