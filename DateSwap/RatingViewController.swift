//
//  RatingViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 02/07/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class RatingViewController: UIViewController {

    @IBOutlet weak var ratingUIView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        ratingUIView.layer.cornerRadius = 20
        ratingUIView.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func rateThisProfileUIButton(_ sender: UIButton) {
        dropdownAnimation(toggle: ratingUIView.isHidden)
    }
    override func viewDidLayoutSubviews() {
        ratingUIView.addJeansEffect(color: darkOrange(), cornerRadius: 20, lineWidth: 2, lineDashPattern: [6,3], distanceTop: 8, distanceSides: 8)
    }
    func dropdownAnimation(toggle: Bool){
        self.ratingUIView.isHidden = false
        
        if toggle{
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
