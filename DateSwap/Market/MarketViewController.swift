//
//  MarketViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 26/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class MarketViewController: UIViewController {
    
    var showSaveSegue: Bool?
    @IBOutlet weak var categoryUILabel: UILabel!
    @IBOutlet weak var marketCollectionView: UICollectionView!
    @IBOutlet weak var wishlistUIButton: ConditionUIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if gProductsDisplayedPlaceholder.count == 0{
            getProducts()
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "category"), object: nil, queue: OperationQueue.main) { (notification) in
            self.displayCategory()
        }
        displayCategory()
        if gSelectedCategory == "Wish List"{
            wishlistUIButton.setTitle("Featured", for: .normal)
}
        // Do any additional setup after loading the view.
    }
    
    func displayCategory(){
        categoryUILabel.text = gSelectedCategory
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getProducts() {
        JustHUD.shared.showInView(view: self.view, withHeader: "Loading", andFooter: "Please Wait")
        getDisplayProduct {
            self.marketCollectionView.reloadData()
            JustHUD.shared.hide()
            
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        if showSaveSegue != nil {
            showToast(message: "Saved your like !", controller: self, delay: 0.5, image: #imageLiteral(resourceName: "ic_like_date"))
        }
    }
    @IBAction func displayMyWishlist(_ sender: Any) {
        if gSelectedCategory != "Wish List"{
            JustHUD.shared.showInView(view: self.view, withHeader: "Loading", andFooter: "Please Wait")
            getUserActiveWishlist { (count) in
                if count == 0{
                    gMyWishlistProducts.append(emptyWishlist)
                    JustHUD.shared.hide()
                    popAlert(title: "Empty Wish List", message: "Why not fill a wish list?", view: self)
                    
                    return
                }
                gProductsDisplayedPlaceholder = gMyWishlistProducts
                self.marketCollectionView.reloadData()
                gSelectedCategory = "Wish List"
                self.displayCategory()
                self.wishlistUIButton.setTitle("Featured", for: UIControlState.normal)
                JustHUD.shared.hide()
            }
        } else {
            gSelectedCategory = "Featured"
            displayCategory()
            wishlistUIButton.setTitle("Wish List", for: .normal)
            getProducts()
            
        }
        
        
    }
}


extension MarketViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gProductsDisplayedPlaceholder.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "marketItems", for: indexPath) as! MarketCollectionViewCell
        let model = gProductsDisplayedPlaceholder[indexPath.item]
        cell.productPrice.text = "\(model.price)$"
        cell.productPicUIImage.sd_setImage(with: URL(string: model.image))
        cell.productPicUIImage.layer.cornerRadius = 20
        cell.productName.text = model.title
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.marketCollectionView.frame.width / 2 - 2, height: self.marketCollectionView.frame.width / 2 - 2 + 20)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        gItemPlaceholder = gProductsDisplayedPlaceholder[indexPath.item]
        performSegue(withIdentifier: "toInfo", sender: nil)
    }
    
}
