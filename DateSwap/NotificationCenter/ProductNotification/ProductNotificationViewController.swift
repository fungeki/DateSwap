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
    var myOffers = [Offer]()
    @IBOutlet weak var itemNameUILabel: UILabel!
    @IBOutlet weak var editItemUIButton: UIButton!
    @IBOutlet weak var statusUIButton: UIButton!
    @IBOutlet weak var conditionImageUIImage: UIImageView!
    @IBOutlet weak var myProductImageUIImage: UIImageView!
    @IBOutlet weak var notificationAmountLabel: EditableLableUILabel!
    @IBOutlet weak var productPriceUILabel: EditableLableUILabel!
    @IBOutlet weak var offerUICollectionView: UICollectionView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        getNotifications()
    }
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
        
        guard let price = productPriceUILabel.text else {return}
        productPriceUILabel.text = "$\(price)"
        
        
        let mURLImage = URL(string: myNotification.image)
        myProductImageUIImage.sd_setImage(with: mURLImage)
        itemNameUILabel.text = myNotification.title
        var priceCompleted = String(myNotification.price)
        priceCompleted.append("$")
        productPriceUILabel.text = priceCompleted
        notificationAmountLabel.text = String(checkRedNotifications(array: myNotification.offers))
        
    }
    
    func getNotifications(){
        JustHUD.shared.showInView(view: self.view, withHeader: "Loading", andFooter: "please wait")
        getMyItemOffers(myItemID: myNotification.id) { (notification) in
            //print(notification.offers)
            self.myOffers = notification.offers
            self.offerUICollectionView.reloadData()
            self.offerUICollectionView.layoutIfNeeded()
            let statusCode = notification.delivered
            let deliveredStatus  = DeliveredStatus.init(id: statusCode)
            if let deliveredStatus = deliveredStatus{
                self.statusUIButton.setTitle(deliveredStatus.rawValue, for: .normal)
                switch deliveredStatus{
                case .active:
                        self.statusUIButton.setTitleColor(UIColor.green, for: .normal)
                default:
                    self.statusUIButton.setTitleColor(UIColor.black, for: .normal)
                }
            }
            
            JustHUD.shared.hide()
        }
    }
    

    override func viewDidLayoutSubviews() {
        notificationAmountLabel.layer.cornerRadius = notificationAmountLabel.layer.frame.size.height / 2
        myProductImageUIImage.layer.cornerRadius = productPriceUILabel.layer.frame.size.height / 2
        productPriceUILabel.layer.cornerRadius = productPriceUILabel.layer.frame.size.height / 2
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toItemDetail" {
            let detailVC = segue.destination as! ViewController
            detailVC.origin = 1
            
        }
    }
}

extension ProductNotificationViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0{
            return myOffers.count
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        getProductByID(id: myOffers[indexPath.item].myproductid) { (product) in
            gItemPlaceholder = product
            self.performSegue(withIdentifier: "toItemDetail", sender: product)
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "offersCell", for: indexPath) as! OffersCollectionViewCell
        let model = myOffers[indexPath.row]
        let imageURL = URL(string: model.image)
        cell.offerCollectionUIImage.sd_setImage(with: imageURL)
        cell.productTitleUILabel.text = model.title
        cell.priceUIlabel.text = "\(model.price)$"
        return cell
    }
    
    
}
