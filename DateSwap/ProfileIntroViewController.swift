//
//  ProfileIntroViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 21/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ProfileIntroViewController: UIViewController {
    var myUser = u1
    var myRating = 0
    @IBAction func distanceChanged(_ sender: PriceSliderUISlider) {
        let currentValue = Int(sender.value)
        switch currentValue {
        case 301, 302, 303, 304, 305:
            distanceUILabel.text = "Unlimited"
        default:
            distanceUILabel.text = "\(currentValue) KM."
        }
        
        
    }
    @IBOutlet weak var editProfileUIButton: UIButton!
    @IBOutlet weak var profileratingUILabel: UILabel!
    @IBOutlet weak var profilechainsawUIButton: UIButton!
    @IBOutlet weak var userNameUILabel: UILabel!
    @IBOutlet weak var addEditDatesUIButton: UIButton!
    
    @IBOutlet weak var distanceUILabel: UILabel!

    @IBOutlet weak var distanceUISlider: PriceSliderUISlider!
    
    @IBOutlet weak var profileIntroUIImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "http://dateswap.herokuapp.com/getaprofile?id=1"
        guard let urlObj = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: urlObj) { (data, response, error) in
            DispatchQueue.main.async {
            guard let data = data else {return}
            do{
                let profileSQL = try JSONDecoder().decode([ProfileSQL].self, from: data)
                let mProfile = profileSQL2internal(profileSQL: profileSQL[0])
                guard let picURL = URL(string: mProfile.pic) else {return}
                self.profileIntroUIImageView.sd_setImage(with: picURL)
                self.userNameUILabel.text = mProfile.nickname
                switch mProfile.rating {
                case 1:
                    self.profilechainsawUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_one"), for: .disabled)
                    break
                case 1.5:
                    self.profilechainsawUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_oneAndaHalf"), for: .normal)
                    break
                case 2:
                    self.profilechainsawUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_two"), for: .normal)
                    break
                case 2.5:
                    self.profilechainsawUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_twoAndaHalf"), for: .normal)
                    break
                case 3:
                    self.profilechainsawUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_three"), for: .normal)
                    break
                case 3.5:
                    self.profilechainsawUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_threeAndaHalf"), for: .normal)
                    break
                case 4:
                    self.profilechainsawUIButton.setImage(#imageLiteral(resourceName: "ic_rating_long_tail_four"), for: .normal)
                    break
//                case 4.5:
//                    profilechainsawUIButton.image = #imageLiteral(resourceName: "ic_rating_long_tail_fourAndaHalf")
//                    break
//                default:
//                    profilechainsawUIButton.image = #imageLiteral(resourceName: "ic_rating_long_tail_five")
                default: break
                    
                    
                }
                
                
                
            }catch {
                print(error)
            }
            }
        }.resume()
//        for i in 0 ..< 5 {
//            myGroup.enter()
//
//            Alamofire.request("https://httpbin.org/get", parameters: ["foo": "bar"]).responseJSON { response in
//                print("Finished request \(i)")
//                myGroup.leave()
//            }
//        }
//
//        myGroup.notify(queue: .main) {
//            print("Finished all requests.")
//        }
//        URLSession.shared.dataTask(with: urlObj) { (data, response, error) in
//            guard let data = data else {return}
//            //            let dataAsString = String(data: data, encoding: .utf8)
//            //
//            //            print("\(dataAsString) my data!!!!!!!!!!!!!!!")
//            do{
//                let mProducts = try JSONDecoder().decode(ProfileSQL.self, from: data)
//                self.myUser = arrayProductsSQL2Local(array: mProducts)
//                self.display = self.displayProducts[self.currentProduct]
//                self.prepareSlider()
//                self.initialize()
//            }catch {
//                print(error)
//            }
//        }.resume()
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    override func viewDidLayoutSubviews() {
        //Edit Profile - Button
        
        editProfileUIButton.addJeansEffect(color: mediumOrange(), cornerRadius: 15, lineWidth: 2, lineDashPattern: [9,9], distanceTop: 5,distanceSides: 5)
        editProfileUIButton.backgroundColor = UIColor(cgColor: lightOrangeOpacity())
        editProfileUIButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        editProfileUIButton.layer.cornerRadius = 15
        
        //Add/Edit Dates - Button
        
        addEditDatesUIButton.addJeansEffect(color: lightOrange(), cornerRadius: 15, lineWidth: 2, lineDashPattern: [9,9], distanceTop: 5,distanceSides: 5)
        addEditDatesUIButton.backgroundColor = UIColor(cgColor: mediumOrange())
        addEditDatesUIButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        addEditDatesUIButton.layer.cornerRadius = 15
        
        
        
        
        
        // editProfileUIButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
       // editProfileUIButton.titleLabel?.textAlignment = .center
      //  editProfileUIButton.setTitle("Edit Profile\nmore text", for: .normal)

        
        profileIntroUIImageView.layer.cornerRadius = profileIntroUIImageView.frame.height/2
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
