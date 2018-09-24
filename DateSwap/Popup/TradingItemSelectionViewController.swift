//
//  TradingItemSelectionViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 22/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class TradingItemSelectionViewController: UIViewController {

    @IBOutlet weak var productTVheightNSConstraint: NSLayoutConstraint!
    @IBOutlet weak var productsUITableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if gOnlineUserProducts.count < 6{
        productTVheightNSConstraint.constant  = CGFloat(gOnlineUserProducts.count * 120 + 32)
        } else {
            productTVheightNSConstraint.constant  = CGFloat(5 * 120 + 32)
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
        cell.itemUIImageView.sd_setImage(with: URL(string: model.image))
        cell.itemUIImageView.layer.cornerRadius = cell.itemUIImageView.frame.height / 2
        cell.priceUIButton.isEnabled = false
        cell.priceUIButton.setTitle("\(model.price)$", for: .disabled)
        cell.descriptionUILabel.text = model.description
        cell.productTitleUILabel.text = model.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        JustHUD.shared.showInView(view: self.view, withHeader: "Loading", andFooter: "please wait")
        gActiveProduct = gOnlineUserProducts[indexPath.row]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "activeProduct"), object: self)
        
        let strURL = "http://dateswap.herokuapp.com/updateprofileactive?id=\(gOnlineUser.ID)&active=\(indexPath.row)"
        guard let objStr = URL(string: strURL) else {return}
        URLSession.shared.dataTask(with: objStr) { (data, res, err) in
            DispatchQueue.main.async {
                JustHUD.shared.hide()
                self.dismiss(animated: true) {
                    
                }
            }
        }
    }
}
