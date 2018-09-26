//
//  MarketViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 26/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class MarketViewController: UIViewController {
    
    @IBOutlet weak var marketCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if gProductsDisplayedPlaceholder.count == 0{
                getProducts()
        }
        // Do any additional setup after loading the view.
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
