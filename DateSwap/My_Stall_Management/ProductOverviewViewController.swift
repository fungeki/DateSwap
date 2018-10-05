//
//  ProductOverviewViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 19/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ProductOverviewViewController: UIViewController {
    
    var displayProducts = [Product]()
    @IBOutlet weak var addDateUITableView: UITableView!
    @IBAction func addANewProductAction(_ sender: UIButton) {
        performSegue(withIdentifier: "addANewDateSegue", sender: nil)
    }
    @IBOutlet weak var addADateUIButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        displayProducts = gOnlineUserProducts
        if displayProducts[0].ID == 4{
            addDateUITableView.allowsSelection = false
        }
        addDateUITableView.reloadData()
        print(gOnlineUserProducts)
//        let url = "http://dateswap.herokuapp.com/userproductdb?userid=\()"
//        guard let urlObj = URL(string: url) else {return}
//
//        URLSession.shared.dataTask(with: urlObj) { (data, response, ic_user) in
//            DispatchQueue.main.async {
//
//
//            guard let data = data else {return}
////            let dataAsString = String(data: data, encoding: .utf8)
////
////            print("\(dataAsString) my data!!!!!!!!!!!!!!!")
//            do{
//                let mProducts = try JSONDecoder().decode([ProductExpSQL].self, from: data)
//                self.displayProducts = arrayProductsSQL2Local(array: mProducts)
//                self.addDateUITableView.reloadData()
//                }catch {
//                    print(error)
//                }
//            }
//        }.resume()
        
//        URLSession.shared.dataTask(with: urlObj!){(data, response, error) in
//            do{
//                let mProducts = try JSONDecoder().decode([ProductExpSQL], from: data!)
//                for pro in mProducts{
//                    print(pro.title)
//                }
//            }catch {
//                print("error")
//            }
//
//        }.resume()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        addADateUIButton.addJeansEffect(color: lightOrange(), cornerRadius: 15, lineWidth: 2, lineDashPattern: [9,9])
        
        addDateUITableView.rowHeight = 170
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
        return displayProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productOverviewCell") as! ProductOverviewTableViewCell
        
        let product = displayProducts[indexPath.row]
        cell.product = product
        cell.productUIImageView.layer.cornerRadius = 20
        cell.productUIImageView.sd_setImage(with: URL(string: product.image))
        cell.titleUILabel.text = product.title
        cell.conditionUIButton.isEnabled = false
        cell.selectionStyle = .none
        cell.descriptionUILabel.numberOfLines = 2
        cell.descriptionUILabel .sizeToFit()
        cell.priceUIButton.isEnabled = false
        cell.priceUIButton.setTitle("\(product.price)$", for: .disabled)
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
        cell.contentView.layoutIfNeeded()
       // cell.priceUIButton.addJeansEffect(UIColor.black.cgColor)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath) as! ProductOverviewTableViewCell
        let product = currentCell.product
        //currentCell.conditionUIButton.backgroundColor = UIColor.orange
        performSegue(withIdentifier: "datesProfileMasterToDetail", sender: product)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC =  segue.destination as? EditMyProductsViewController else {return}
        if sender == nil {
            detailsVC.pageHeader = "Add / Edit Item"
            detailsVC.product = nil
        }else{
            guard let product = sender as? Product else {return}
            detailsVC.pageHeader = "Editing Date"
            detailsVC.product = product
            detailsVC.edit = true
        }
//        guard let product = sender as? Product else {
//            detailsVC.pageHeader = "New Date"
//            detailsVC.product = nil
//            return
//        }
//        detailsVC.pageHeader = "Editing Date"
//        detailsVC.product = product
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            let currentCell = tableView.cellForRow(at: indexPath) as! ProfileTableViewCell
//            let product = currentCell.product
//            //  currentCell.conditionUIButton.backgroundColor = UIColor.orange
//            performSegue(withIdentifier: "masterToDetail", sender: product)
//        }
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            guard let detailsVC =  segue.destination as? DetailsFromProfileViewController,
//                let product = sender as? Product else {return}
//
//            detailsVC.product = product
//        }
    }
    
   
    
    
}
