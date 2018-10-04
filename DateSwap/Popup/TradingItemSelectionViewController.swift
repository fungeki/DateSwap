//
//  TradingItemSelectionViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 22/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class TradingItemSelectionViewController: UIViewController {


    var origin : ViewController?
    @IBOutlet weak var selectMsgUIlabel: UILabel!
    @IBOutlet weak var productTVheightNSConstraint: NSLayoutConstraint!
    @IBOutlet weak var productsUITableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let msgHeight = Int(selectMsgUIlabel.frame.height)
        if gOnlineUserProducts.count < 5{
        productTVheightNSConstraint.constant  = CGFloat(gOnlineUserProducts.count * 120 + msgHeight + 4)
        } else {
            productTVheightNSConstraint.constant  = CGFloat(4 * 120 + msgHeight + 4)
        }
        print("online user products:")
        print(gOnlineUserProducts)
        if gOnlineUserProducts[0].userID == 0 {
            productsUITableView.allowsSelection = false
        }
            // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true)
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

extension TradingItemSelectionViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gOnlineUserProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectItemCell") as! TradingItemSelectTableViewCell
        let model = gOnlineUserProducts[indexPath.row]
        cell.product = model
        cell.itemUIImageView.sd_setImage(with: URL(string: model.image))
        cell.itemUIImageView.layer.cornerRadius = cell.itemUIImageView.frame.height / 2
        cell.priceUIButton.isEnabled = false
        cell.priceUIButton.setTitle("\(model.price)$", for: .disabled)
        cell.descriptionUILabel.text = model.description
        cell.productTitleUILabel.text = model.title
        cell.priceUIButton.addJeansEffect(UIColor.black.cgColor)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if origin != nil {
            JustHUD.shared.showInView(view: self.view, withHeader: "Loading", andFooter: "Please Wait")
            pushLike(myProdID: gOnlineUserProducts[indexPath.row].ID, completion: { (likesDis) in
                checkMatch(like: likesDis, completion: { (likes) in
                    var didMatch = false
                    if likes.count > 1{
                       didMatch = true
                    }
                    JustHUD.shared.hide()
                    self.dismiss(animated: true, completion: {
                        
                        guard let targetVC =  self.origin else {return}
                        targetVC.moveToMarketWithToast(matched: didMatch)
                    })
                })
            
            
            })
            
        } else {
        
        JustHUD.shared.showInView(view: self.view, withHeader: "Loading", andFooter: "please wait")
        gActiveProduct = gOnlineUserProducts[indexPath.row]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "activeProduct"), object: self)
        
        let strURL = "http://dateswap.herokuapp.com/updateprofileactive?id=\(gOnlineUser.ID)&active=\(gActiveProduct.ID)"
        print(strURL)
        guard let objStr = URL(string: strURL) else {return}
        URLSession.shared.dataTask(with: objStr) { (data, res, err) in
            DispatchQueue.main.async {
                JustHUD.shared.hide()
                self.dismiss(animated: true) {
                    
                }
            }
    
            
        }.resume()
    }
}
}
