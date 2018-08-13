//
//  ReviewViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 17/07/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    
    
    @IBOutlet weak var writtenTextUITextView: DescriptionUITextView!
    @IBOutlet weak var r5UIButton: UIButton!
    @IBOutlet weak var r4UIButton: UIButton!
    @IBOutlet weak var r3UIButton: UIButton!
    @IBOutlet weak var r2UIButton: UIButton!
    @IBOutlet weak var r1UIButton: UIButton!
    @IBOutlet weak var ratingCardUIView: UIView!
    @IBOutlet weak var rateUIView: UIView!
    @IBOutlet weak var usernameUILabel: UILabel!
    let profile: Profile = u5
    @IBOutlet weak var chainsawUIImageView: UIImageView!
    @IBOutlet weak var profileUIImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        rateUIView.layer.cornerRadius = rateUIView.frame.height / 2
        ratingCardUIView.isHidden = true

        usernameUILabel.text = profile.nickname
        profileUIImageView.sd_setImage(with: URL(string: profile.pic))
        switch profile.rating {
        case 1:
            chainsawUIImageView.image = #imageLiteral(resourceName: "ic_rating_long_tail_one")
            break
        case 1.5:
            chainsawUIImageView.image = #imageLiteral(resourceName: "ic_rating_long_tail_oneAndaHalf")
            break
        case 2:
            chainsawUIImageView.image = #imageLiteral(resourceName: "ic_rating_long_tail_two")
            break
        case 2.5:
            chainsawUIImageView.image = #imageLiteral(resourceName: "ic_rating_long_tail_twoAndaHalf")
            break
        case 3:
            chainsawUIImageView.image = #imageLiteral(resourceName: "ic_rating_long_tail_three")
            break
        case 3.5:
            chainsawUIImageView.image = #imageLiteral(resourceName: "ic_rating_long_tail_threeAndaHalf")
            break
        case 4:
            chainsawUIImageView.image = #imageLiteral(resourceName: "ic_rating_long_tail_four")
            break
        case 4.5:
            chainsawUIImageView.image = #imageLiteral(resourceName: "ic_rating_long_tail_fourAndaHalf")
            break
        default:
            chainsawUIImageView.image = #imageLiteral(resourceName: "ic_rating_long_tail_five")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sendReview(_ sender: UIButton) {
         dropdownAnimation(toggle: ratingCardUIView.isHidden)
    }
    
    @IBAction func rating(_ sender: UIButton) {
        resetStars()
        switch sender.tag {
        case 1:
            lightOneStar()
            break
        case 2:
            lightTwoStars()
            break
        case 3:
            lightThreeStars()
            break
        case 4:
            lightFourStars()
            break
        default:
            lightFiveStars()
        }
        if !ratingCardUIView.isHidden{
            return
        }
        dropdownAnimation(toggle: ratingCardUIView.isHidden)
    }
    override func viewDidLayoutSubviews() {
        profileUIImageView.layer.cornerRadius = profileUIImageView.frame.height / 2
        profileUIImageView.layer.borderWidth = 3
        profileUIImageView.layer.borderColor = UIColor.white.cgColor
        usernameUILabel.adjustsFontSizeToFitWidth = true
      
    }

    func dropdownAnimation(toggle: Bool){
//        ratingUIView.addJeansEffect(color: darkOrange(), cornerRadius: 20, lineWidth: 2, lineDashPattern: [6,3], distanceTop: 8, distanceSides: 8)
//
//
//        let bottomStripe = CGAffineTransform(translationX: 0, y: 110)
        
        let scaleDown = CGAffineTransform(scaleX: 0.1, y: 1)
        let scaleDown2 = CGAffineTransform(scaleX: 0.001, y: 1)
        let scaleWidth = CGAffineTransform(scaleX: 1, y: 1)
        
        let moveUp = CGAffineTransform(translationX: 0, y: -120)
        let moveDown = CGAffineTransform(translationX: 0, y: 0)
        if toggle{
            self.ratingCardUIView.isHidden = false
              writtenTextUITextView.addJeansEffect(color: darkOrange(), cornerRadius: 10, lineWidth: 2, lineDashPattern: [6,3], distanceTop: 0, distanceSides: 8)
//            let sizeTransform = CGAffineTransform(scaleX: 0.1, y: 0.2)
//            let translateMove = CGAffineTransform(translationX: ratingCardUIView.frame.width / 2, y: 150 )
//            let translateMove2 = CGAffineTransform(translationX: 0, y: -100)
//            let widthback = CGAffineTransform(scaleX: 1, y: 0.2)
//            let heightback = CGAffineTransform(scaleX: 1, y: 1)
//            self.ratingCardUIView.transform = sizeTransform.concatenating(translateMove)
//            UIView.animate(withDuration: 0.2, animations: {
//                self.ratingCardUIView.transform = widthback.concatenating(translateMove2)
//            }, completion: { (true) in
//                UIView.animate(withDuration: 0.4, animations: {
//                    self.ratingCardUIView.transform = heightback
//                })
//
//            })
            self.ratingCardUIView.transform = scaleDown
            UIView.animate(withDuration: 0.2, animations: {
            self.ratingCardUIView.transform = scaleWidth
            }, completion: { (true) in
                UIView.animate(withDuration: 0.2, animations: {
                    self.rateUIView.transform = moveUp
                    self.ratingCardUIView.transform = moveUp
                })
            
            })
        } else {
//            let widthback = CGAffineTransform(scaleX: 1, y: 0.2)
//            let translateMove = CGAffineTransform(translationX: 0, y: -130)
//            let sizeTransform = CGAffineTransform(scaleX: 0.01, y: 0.01)
//            let translateMove2 = CGAffineTransform(translationX: -140, y: -160)
//            UIView.animate(withDuration: 0.4, animations: {
//                self.ratingCardUIView.transform = widthback.concatenating(translateMove)
//            }, completion: { (true) in
//                //self.ratingUIView.isHidden = true
//                UIView.animate(withDuration: 0.2, animations: {
//                    self.ratingCardUIView.transform = sizeTransform.concatenating(translateMove2)
//                }, completion: { (true) in
//                    self.ratingCardUIView.isHidden = true
//                })
//            })
            UIView.animate(withDuration: 0.2, animations: {
                self.rateUIView.transform = moveDown
                self.ratingCardUIView.transform = moveDown
            }, completion: { (true) in
                UIView.animate(withDuration: 0.2, animations: {
                    self.ratingCardUIView.transform = scaleDown2
                }, completion: { (true) in
                    self.ratingCardUIView.isHidden = true
                })
                
            })
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func resetStars(){
        r1UIButton.setImage(#imageLiteral(resourceName: "ic_rating_star_empty"), for: .normal)
        r2UIButton.setImage(#imageLiteral(resourceName: "ic_rating_star_empty"), for: .normal)
        r3UIButton.setImage(#imageLiteral(resourceName: "ic_rating_star_empty"), for: .normal)
        r4UIButton.setImage(#imageLiteral(resourceName: "ic_rating_star_empty"), for: .normal)
        r5UIButton.setImage(#imageLiteral(resourceName: "ic_rating_star_empty"), for: .normal)
    }
    func lightOneStar(){
        //        oneStarUIButton.setBackgroundImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .normal)
        r1UIButton.setImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .normal)
    }
    func lightTwoStars(){
        lightOneStar()
        //        twoStarUIButton.setBackgroundImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .normal)
        r2UIButton.setImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .normal)
    }
    func lightThreeStars(){
        lightTwoStars()
        //        threeStarUIButton.setBackgroundImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .normal)
        r3UIButton.setImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .normal)
    }
    func lightFourStars(){
        lightThreeStars()
        //        fourStarUIButton.setBackgroundImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .normal)
        r4UIButton.setImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .normal)
    }
    func lightFiveStars(){
        lightFourStars()
        //        fiveStarUIButton.setBackgroundImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .normal)
        r5UIButton.setImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .normal)
    }
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

extension ReviewViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if (textView.text == "Type your experience here :)")
        {
            textView.text = ""
            textView.textColor = UIColor(cgColor: mediumOrange())
            
        }
        textView.becomeFirstResponder() //Optional
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView)
    {
        if (textView.text == "")
        {
            textView.text = "Type your experience here :)"
            textView.textColor = .lightGray
        }
        textView.resignFirstResponder()
    }
}
