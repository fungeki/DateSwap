//
//  ProfileViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 14/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userImageStallPageUIImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        userImageStallPageUIImageView.layer.cornerRadius = userImageStallPageUIImageView.frame.height/2
        userImageStallPageUIImageView.layer.borderWidth = 3
        userImageStallPageUIImageView.layer.borderColor = UIColor.white.cgColor
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
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
//    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        let currentCell = tableView.cellForRow(at: indexPath) as! ProfileTableViewCell
//        let product = currentCell.product
//        currentCell.conditionUIButton.backgroundColor = UIColor.orange
//        performSegue(withIdentifier: "masterToDetail", sender: product)
//        return nil
//    }
    
    
    
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell") as! ProfileTableViewCell
        
        let product = products[indexPath.row]
        
        cell.product = product
        cell.selectionStyle = .none
        cell.itemImageView.sd_setImage(with: URL(string: product.image))
        cell.itemImageView.layer.cornerRadius = 20
        cell.itemName.text = product.title
        cell.conditionUIButton.isEnabled = false
        cell.conditionUIButton.setTitle(returnCondition(product.condition), for: .disabled)
        var str = product.description
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath) as! ProfileTableViewCell
        let product = currentCell.product
      //  currentCell.conditionUIButton.backgroundColor = UIColor.orange
        performSegue(withIdentifier: "masterToDetail", sender: product)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC =  segue.destination as? DetailsFromProfileViewController,
        let product = sender as? Product else {return}
        
        detailsVC.product = product
    }
    
    
}
