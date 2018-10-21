//
//  ProductNotificationViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 17/10/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ProductNotificationViewController: UIViewController {

    @IBOutlet weak var conditionImageUIImage: UIImageView!
    @IBOutlet weak var myProductImageUIImage: UIImageView!
    @IBOutlet weak var notificationAmountLabel: EditableLableUILabel!
    @IBOutlet weak var productPriceUILabel: EditableLableUILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        productPriceUILabel.layer.cornerRadius = productPriceUILabel.frame.size.height / 2
        guard let price = productPriceUILabel.text else {return}
        productPriceUILabel.text = "$\(price)"
        notificationAmountLabel.layer.cornerRadius = notificationAmountLabel.frame.size.height / 2
        myProductImageUIImage.layer.cornerRadius = 20
        
        // Do any additional setup after loading the view.
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

extension ProductNotificationViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "offersCell", for: indexPath) as! OffersCollectionViewCell
        return cell
    }
    
    
}
