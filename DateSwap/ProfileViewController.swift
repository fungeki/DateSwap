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
    @IBOutlet weak var userNameUILabel: UILabel!
    @IBOutlet weak var stallUITable: UITableView!
    
    @IBOutlet weak var userPicUIImage: UIImageView!
    @IBOutlet weak var userChainsawRatingUIButton: UIButton!
    @IBOutlet weak var userRatingUILabel: UILabel!
    
    var myProfile = u1
    var userItems = products
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeProfile()
        let stringURL = "http://dateswap.herokuapp.com/userproductdb?userid=\(myProfile.ID)"
        guard let objURL = URL(string: stringURL) else {return}
        URLSession.shared.dataTask(with: objURL) { (data, response, error) in
            DispatchQueue.main.async {
                
                
                guard let data = data else {return}
                //            let dataAsString = String(data: data, encoding: .utf8)
                //
                //            print("\(dataAsString) my data!!!!!!!!!!!!!!!")
                do{
                    let mProducts = try JSONDecoder().decode([ProductExpSQL].self, from: data)
                    self.userItems = arrayProductsSQL2Local(array: mProducts)
                    self.stallUITable.reloadData()
                }catch {
                    print(error)
                }
            }
        }.resume()
        // Do any additional setup after loading the view.
    }
    
    func initializeProfile(){
        userNameUILabel.text = myProfile.nickname
        userRatingUILabel.text = String(myProfile.rating)
        userPicUIImage.sd_setImage(with: URL(string: myProfile.pic))
        switch self.myProfile.rating {
        case 1:
            self.userChainsawRatingUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_one"), for: .normal)
            break
        case 1.5:
            self.userChainsawRatingUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_oneAndaHalf"), for: .normal)
            break
        case 2:
            self.userChainsawRatingUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_two"), for: .normal)
            break
        case 2.5:
            self.userChainsawRatingUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_twoAndaHalf"), for: .normal)
            break
        case 3:
            self.userChainsawRatingUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_threeAndaHalf"), for: .normal)
            break
        case 3.5:
            self.userChainsawRatingUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_threeAndaHalf"), for: .normal)
            break
        case 4:
            self.userChainsawRatingUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_four"), for: .normal)
            break
        case 4.5:
            self.userChainsawRatingUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_fourAndaHalf"), for: .normal)
            break
        default:
            self.userChainsawRatingUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_five"), for: .normal)
            break
        }
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
        return userItems.count
    }
//    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        let currentCell = tableView.cellForRow(at: indexPath) as! ProfileTableViewCell
//        let product = currentCell.product
//        currentCell.conditionUIButton.backgroundColor = UIColor.orange
//        performSegue(withIdentifier: "masterToDetail", sender: product)
//        return nil
// }
    
    
    
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell") as! ProfileTableViewCell
        
        let product = userItems[indexPath.row]
        
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
