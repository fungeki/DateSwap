//
//  ProductNotificationViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 17/10/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ProductNotificationViewController: UIViewController {
    
    var myNotification: Notification!
    @IBOutlet weak var itemNameUILabel: UILabel!
    @IBOutlet weak var editItemUIButton: UIButton!
    @IBOutlet weak var statusUIButton: UIButton!
    @IBOutlet weak var conditionImageUIImage: UIImageView!
    @IBOutlet weak var myProductImageUIImage: UIImageView!
    @IBOutlet weak var notificationAmountLabel: EditableLableUILabel!
    @IBOutlet weak var productPriceUILabel: EditableLableUILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initialize(){
        productPriceUILabel.layer.cornerRadius = productPriceUILabel.layer.frame.size.height / 2
        guard let price = productPriceUILabel.text else {return}
        productPriceUILabel.text = "$\(price)"
        
        myProductImageUIImage.layer.cornerRadius = 20
        let mURLImage = URL(string: myNotification.image)
        myProductImageUIImage.sd_setImage(with: mURLImage)
        itemNameUILabel.text = myNotification.title
        var priceCompleted = String(myNotification.price)
        priceCompleted.append("$")
        productPriceUILabel.text = priceCompleted
        notificationAmountLabel.text = String(checkRedNotifications(array: myNotification.offers))
    }
    override func viewDidLayoutSubviews() {
        notificationAmountLabel.layer.cornerRadius = notificationAmountLabel.layer.frame.size.height / 2
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func checkRedNotifications(array arr: [Like])->Int{
        var temp = 0
        for like in arr{
            if like.status == 0{
                temp += 1
            }
        }
        return temp
    }
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
