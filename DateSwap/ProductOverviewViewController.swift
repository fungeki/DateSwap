//
//  ProductOverviewViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 19/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ProductOverviewViewController: UIViewController {

    @IBOutlet weak var addADateUIButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        addADateUIButton.addJeansEffect(UIColor.orange.cgColor)
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
extension ProductOverviewViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productOverviewCell") as! ProductOverviewTableViewCell
        
        let product = products[indexPath.row]
        
        cell.product = product
        cell.productUIImageView.layer.cornerRadius = 20
        cell.productUIImageView.sd_setImage(with: URL(string: product.image))
        
        cell.titleUILabel.text = product.title
        cell.conditionUIButton.isEnabled = false
        cell.descriptionUILabel.numberOfLines = 2
        cell.descriptionUILabel .sizeToFit()
        
        cell.priceUIButton.isEnabled = false
        cell.priceUIButton.setTitle(product.price, for: .disabled)
        cell.priceUIButton.addJeansEffect(UIColor.black.cgColor)
        cell.conditionUIButton.setTitle(returnCondition(product.condition), for: .disabled)
        let str = product.description
        let start = str.startIndex
        var end = str.endIndex
        var suffix = ""
        if (str.count > 100){
            end = str.index(start, offsetBy: 100)
            suffix = "..."
        }        // range
        let range = start..<end
        cell.descriptionUILabel.text = String(str[range]) + suffix
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let currentCell = tableView.cellForRow(at: indexPath) as! ProfileTableViewCell
//        let product = currentCell.product
//        performSegue(withIdentifier: "masterToDetail", sender: product)
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let detailsVC =  segue.destination as? DetailsFromProfileViewController,
//            let product = sender as? Product else {return}
//
//        detailsVC.product = product
//    }
    
    
}
