//
//  ProfileIntroViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 21/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ProfileIntroViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var myRating = 0

    @IBOutlet weak var editProfileUIButton: UIButton!
    @IBOutlet weak var profileratingUILabel: UILabel!
    @IBOutlet weak var profilechainsawUIButton: UIButton!
    @IBOutlet weak var userNameUILabel: UILabel!
    @IBOutlet weak var addEditDatesUIButton: UIButton!
    @IBOutlet weak var profileIntroUIButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()

    }

    func initialize(){
        
        profileIntroUIButton.sd_setImage(with: URL(string: gOnlineUser.pic), for: .normal)

        userNameUILabel.text = gOnlineUser.nickname
        // print(mProfile)
        //print(profileSQL)
        
        
        switch gOnlineUser.rating {
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
        case 4.5:
            self.profilechainsawUIButton.setImage(#imageLiteral(resourceName: "ic_rating_fourAndaHalf"), for: .normal)
            break
        case 5:
            self.profilechainsawUIButton.setImage(#imageLiteral(resourceName: "ic_rating_five"), for: .normal)
            break
        default:
            self.profilechainsawUIButton.setImage(#imageLiteral(resourceName: "ic_rating_flag_tail_empty"), for: .normal)
            break
        }
        profileratingUILabel.text = String(gOnlineUser.rating)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func changePhoto(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet =  UIAlertController(title: "Photo Source", message: "Please choose which source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            imagePickerController.sourceType = .camera
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.present(imagePickerController, animated: true, completion: nil)
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.allowsEditing = true
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                self.present(imagePickerController, animated: true, completion: nil)
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: { (action) in
            
        }))
        self.present(actionSheet, animated: true) {
            
        }

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    let image = info[UIImagePickerControllerOriginalImage] as! UIImage
    let compressedImage = resizeImage(image)
    profileIntroUIButton.setImage(compressedImage, for: .normal)
    profileIntroUIButton.layer.cornerRadius = profileIntroUIButton.frame.height / 2
    let imageToUp = UIImageJPEGRepresentation(compressedImage, 1)! as NSData
    
    picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        //Edit Profile - Button
        
        editProfileUIButton.addJeansEffect(color: mediumOrange(), cornerRadius: 15, lineWidth: 2, lineDashPattern: [9,9], distanceTop: 5,distanceSides: 5)
        editProfileUIButton.backgroundColor = UIColor(cgColor: lightOrangeOpacityManual(alphaColor: 0.8))
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

        
        profileIntroUIButton.layer.cornerRadius = profileIntroUIButton.frame.height/2
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
//        let urlString = "http://dateswap.herokuapp.com/getaprofile?id=1"
//        guard let urlObj = URL(string: urlString) else {return}
//        URLSession.shared.dataTask(with: urlObj) { (data, response, error) in
//            DispatchQueue.main.async {
//            guard let data = data else {return}
//            do{
//                let profileSQL = try JSONDecoder().decode([ProfileSQL].self, from: data)
//                let mProfile = profileSQL2internal(profileSQL: profileSQL[0])
//                guard let picURL = URL(string: mProfile.pic) else {return}

//
//
//            }catch {
//                print(error)
//            }
//            }
//        }.resume()
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

//    @IBAction func distanceChanged(_ sender: PriceSliderUISlider) {
//        let currentValue = Int(sender.value)
//        switch currentValue {
//        case 301, 302, 303, 304, 305:
//            distanceUILabel.text = "Unlimited"
//        default:
//            distanceUILabel.text = "\(currentValue) KM."
//        }
//}
