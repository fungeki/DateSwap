//
//  ReviewViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 17/07/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet weak var usernameUILabel: UILabel!
    let profile: Profile = u5
    @IBOutlet weak var chainsawUIImageView: UIImageView!
    @IBOutlet weak var profileUIImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameUILabel.text = profile.nickname
        profileUIImageView.sd_setImage(with: URL(string: profile.pic))
        switch profile.rating {
        case 1:
            chainsawUIImageView.image = #imageLiteral(resourceName: "ic_rating_one")
            break
        case 1.5:
            chainsawUIImageView.image=#imageLiteral(resourceName: "ic_rating_oneAndaHalf")
            break
        case 2:
            chainsawUIImageView.image = #imageLiteral(resourceName: "ic_rating_two")
            break
        case 2.5:
            chainsawUIImageView.image = #imageLiteral(resourceName: "ic_rating_twoAndaHalf")
            break
        case 3:
            chainsawUIImageView.image = #imageLiteral(resourceName: "ic_rating_three")
            break
        case 3.5:
            chainsawUIImageView.image = #imageLiteral(resourceName: "ic_rating_threeAndaHalf")
            break
        case 4:
            chainsawUIImageView.image = #imageLiteral(resourceName: "ic_rating_four")
            break
        case 4.5:
            chainsawUIImageView.image = #imageLiteral(resourceName: "ic_rating_fourAndaHalf")
            break
        default:
            chainsawUIImageView.image = #imageLiteral(resourceName: "ic_rating_five")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        profileUIImageView.layer.cornerRadius = profileUIImageView.frame.height / 2
        profileUIImageView.layer.borderWidth = 6
        profileUIImageView.layer.borderColor = UIColor.white.cgColor
        usernameUILabel.adjustsFontSizeToFitWidth = true
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
extension ReviewViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell") as! ReviewTableViewCell
        let user = profiles[indexPath.row]
        let mReview = reviews[indexPath.row]
        cell.user = user
        cell.review = mReview
        if mReview.stars >= 1 {cell.star1.image = #imageLiteral(resourceName: "ic_rating_star_full") }
        if mReview.stars >= 2 {cell.star2.image = #imageLiteral(resourceName: "ic_rating_star_full") }
        if mReview.stars >= 3 {cell.star3.image = #imageLiteral(resourceName: "ic_rating_star_full") }
        if mReview.stars >= 4 {cell.star4.image = #imageLiteral(resourceName: "ic_rating_star_full") }
        if mReview.stars >= 5 {cell.star5.image = #imageLiteral(resourceName: "ic_rating_star_full") }
        cell.userNameUILabel.text = user.nickname
        cell.profileImageUIImageView.sd_setImage(with: URL(string: user.pic))
        cell.contentUILabel.text = mReview.text
        cell.profileImageUIImageView.layer.cornerRadius = 20
        cell.profileImageUIImageView.layer.masksToBounds = true
        cell.profileImageUIImageView.clipsToBounds = true
        cell.contentUILabel.numberOfLines = 0
        cell.contentUILabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.contentUILabel.sizeToFit()
        cell.userNameUILabel.adjustsFontSizeToFitWidth = true
        return cell
    }
    
    
}
