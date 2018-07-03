//
//  RatingViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 02/07/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class RatingViewController: UIViewController {

    
    
    

    @IBOutlet weak var starsUIStackView: UIStackView!
    @IBOutlet weak var oneStarUIButton: UIButton!
    @IBOutlet weak var chainsawUIImageView: UIImageView!
    @IBOutlet weak var twoStarUIButton: UIButton!
    @IBOutlet weak var threeStarUIButton: UIButton!
    @IBOutlet weak var fourStarUIButton: UIButton!
    @IBOutlet weak var fiveStarUIButton: UIButton!
    @IBOutlet weak var ratingUIView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

 
        
        
        ratingUIView.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidLayoutSubviews() {
//        ratingUIView.addJeansEffect(color: darkOrange(), cornerRadius: 20, lineWidth: 2, lineDashPattern: [6,3], distanceTop: 8, distanceSides: 8)
        ratingUIView.layer.cornerRadius = 20
        chainsawUIImageView.layer.zPosition = .greatestFiniteMagnitude - 1
        starsUIStackView.layer.zPosition = .greatestFiniteMagnitude
    }
    func dropdownAnimation(toggle: Bool){
        ratingUIView.addJeansEffect(color: darkOrange(), cornerRadius: 20, lineWidth: 2, lineDashPattern: [6,3], distanceTop: 8, distanceSides: 8)
        
        
        if toggle{
            self.ratingUIView.isHidden = false
            let sizeTransform = CGAffineTransform(scaleX: 0.1, y: 0.2)
            let translateMove = CGAffineTransform(translationX: -140, y: -160)
            let translateMove2 = CGAffineTransform(translationX: 0, y: -130)
            let widthback = CGAffineTransform(scaleX: 1, y: 0.2)
            let heightback = CGAffineTransform(scaleX: 1, y: 1)
            self.ratingUIView.transform = sizeTransform.concatenating(translateMove)
            UIView.animate(withDuration: 0.2, animations: {
                self.ratingUIView.transform = widthback.concatenating(translateMove2)
            }, completion: { (true) in
                UIView.animate(withDuration: 0.4, animations: {
                    self.ratingUIView.transform = heightback
                })
                
            })
        } else {
            let widthback = CGAffineTransform(scaleX: 1, y: 0.2)
            let translateMove = CGAffineTransform(translationX: 0, y: -130)
            let sizeTransform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            let translateMove2 = CGAffineTransform(translationX: -140, y: -160)
            UIView.animate(withDuration: 0.4, animations: {
                self.ratingUIView.transform = widthback.concatenating(translateMove)
            }, completion: { (true) in
                    //self.ratingUIView.isHidden = true
                UIView.animate(withDuration: 0.2, animations: {
                    self.ratingUIView.transform = sizeTransform.concatenating(translateMove2)
                }, completion: { (true) in
                    self.ratingUIView.isHidden = true
                })
                })
        }
    }
    @IBAction func ratingSelection(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            lightOneStar()
            dropdownAnimation(toggle: true)
            disableStars()
            break
        case 2:
            lightTwoStars()
            dropdownAnimation(toggle: true)
            disableStars()
            break
        case 3:
            lightThreeStars()
            dropdownAnimation(toggle: true)
            disableStars()
            break
        case 4:
            lightFourStars()
            dropdownAnimation(toggle: true)
            disableStars()
            break
        case 5:
            lightFiveStars()
            dropdownAnimation(toggle: true)
            disableStars()
            break
        default:
            return
            
        }
        
    }
    func disableStars(){
        oneStarUIButton.isEnabled = false
        twoStarUIButton.isEnabled = false
        threeStarUIButton.isEnabled = false
        fourStarUIButton.isEnabled = false
        fiveStarUIButton.isEnabled = false
    }
    func enableStars(){
        oneStarUIButton.isEnabled = true
        twoStarUIButton.isEnabled = true
        threeStarUIButton.isEnabled = true
        fourStarUIButton.isEnabled = true
        fiveStarUIButton.isEnabled = true
    }
    func lightOneStar(){
//        oneStarUIButton.setBackgroundImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .normal)
        oneStarUIButton.setBackgroundImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .disabled)
    }
    func lightTwoStars(){
        lightOneStar()
//        twoStarUIButton.setBackgroundImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .normal)
        twoStarUIButton.setBackgroundImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .disabled)
    }
    func lightThreeStars(){
        lightTwoStars()
//        threeStarUIButton.setBackgroundImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .normal)
        threeStarUIButton.setBackgroundImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .disabled)
    }
    func lightFourStars(){
        lightThreeStars()
//        fourStarUIButton.setBackgroundImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .normal)
        fourStarUIButton.setBackgroundImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .disabled)
    }
    func lightFiveStars(){
        lightFourStars()
//        fiveStarUIButton.setBackgroundImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .normal)
        fiveStarUIButton.setBackgroundImage(#imageLiteral(resourceName: "ic_rating_star_full"), for: .disabled)
    }
    
    @IBAction func rolldownRatingAction(_ sender: UIButton) {
        dropdownAnimation(toggle: false)
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
extension RatingViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if (textView.text == "Leave a review here :)")
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
            textView.text = "Leave a review here :)"
            textView.textColor = .lightGray
        }
        textView.resignFirstResponder()
    }
}
