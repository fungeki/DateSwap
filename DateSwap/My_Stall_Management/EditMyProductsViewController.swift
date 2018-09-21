//
//  EditMyProductsViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 21/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit
import FirebaseStorage

class EditMyProductsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    var price: Int = 0
    @IBAction func toPrice(_ sender: ProductEditTextfield) {
        guard let newPrice = sender.text else {return}
        price = (newPrice as NSString).integerValue
        sender.text = "\(String(describing: sender.text))$"
    }
    @IBOutlet weak var estimatedPriceUITextField: ProductEditTextfield!
    
    var edit = false
    var didEditPic = false
    
    @IBOutlet var superviewUIView: UIView!
    var mImage2Upload : NSData?
    var mTitle : String?
    var mDescription: String?
    var mCondition : Int?
    var mPrice : Int?
    var condition : Int?
    
    let placeholerDescription = "Enter your product's description here"
    
    @IBOutlet weak var descriptionUITextView: UITextView!
    @IBOutlet weak var productTitleUITextField: UITextField!
    
    @IBOutlet weak var dropDownMenu: UIStackView!
    @IBOutlet weak var conditionSelectionTableView: UITableView!
    @IBOutlet weak var dropDownConditionUIButton: ConditionUIButton!
    @IBOutlet weak var addANewPhotoUIButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    var product: Product?
    var locationOfProduct : Int?
    var pageHeader: String!
    var conditionListing = returnConditionArray()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        initialize()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        addANewPhotoUIButton.addJeansEffect(color: lightOrange(), cornerRadius: 20, lineWidth: 2, lineDashPattern: [9,9])
        
        
    }
    
    //change colors HERE //and the initialize
    
    func initialize (){
        descriptionUITextView.delegate = self
        descriptionUITextView.layer.borderColor = brown()
        productTitleUITextField.layer.borderColor = brown()
        descriptionUITextView.layer.borderWidth = 4
//        maxPriceUISlider.maximumTrackTintColor  = UIColor.init(cgColor: grayTwo())
//        minPriceUISlider.minimumTrackTintColor = UIColor.init(cgColor: grayTwo())
//        minPriceUISlider.maximumTrackTintColor = UIColor.init(cgColor: mediumOrange())
//        minPriceUISlider.thumbTintColor = UIColor.init(cgColor: mediumOrange())
//        maxPriceUISlider.minimumTrackTintColor = UIColor.init(cgColor: mediumOrange())
//        maxPriceUISlider.thumbTintColor = UIColor.init(cgColor: mediumOrange())
        headerLabel.text = pageHeader
        conditionSelectionTableView.isHidden = true
        guard let inputThisProduct = product else {
            self.descriptionUITextView.text = placeholerDescription
            self.descriptionUITextView.textColor = UIColor.lightGray
            return}
        edit = true
        let conditionVal = inputThisProduct.condition
        condition = conditionVal.rawValue
        productTitleUITextField.text = inputThisProduct.title
        estimatedPriceUITextField.text = inputThisProduct.price
        descriptionUITextView.text = inputThisProduct.description
        dropDownConditionUIButton.setTitle(returnCondition(inputThisProduct.condition), for: .normal)
        addANewPhotoUIButton.setTitle("", for: .normal)
//        addANewPhotoUIButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        addANewPhotoUIButton.sd_setBackgroundImage(with: URL(string: inputThisProduct.image), for: .normal)
        addANewPhotoUIButton.layer.cornerRadius = 20
        price = (inputThisProduct.price as NSString).integerValue
        descriptionUITextView.textColor = UIColor.brown
    }

    func textViewDidEndEditing(_ textView: UITextView) {
    if textView.text.isEmpty {
        textView.text = placeholerDescription
        textView.textColor = UIColor.lightGray
    }
}
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func backToMyStall(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "onlineUserStall") as! ProductOverviewViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    @IBAction func SaveProduct(_ sender: Any) {
        let pleaseFill = "Please fill in all the fields"
        let set =  charSetForInput.inverted
        
        guard let tempTitle = productTitleUITextField.text else {
            popAlert(title: "No Title", message: pleaseFill, view: self)
            print("product title text field empty")
            return
        }
        
        var trimmedString = tempTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        trimmedString = trimmedString.trimmingCharacters(in: .illegalCharacters)
        trimmedString = trimmedString.trimmingCharacters(in: .punctuationCharacters)
        if trimmedString.count < 5 {
            popAlert(title: "Description Too Short", message: pleaseFill, view: self)
            print("name too short")
            return
        }
        
        if trimmedString.count > 100 {
            popAlert(title: "Title too long", message: "please fill in a shorter title", view: self)
            print("name too long")
            return
        }
        
        mTitle = trimmedString
        guard var upTitle = mTitle else {
            popAlert(title: "No Title", message: pleaseFill, view: self)
            print("no title!")
            return
        }
        
        upTitle = upTitle.components(separatedBy: set).joined()
        guard var mDescription = descriptionUITextView.text else {
            popAlert(title: "No Description", message: pleaseFill, view: self)
            print("no description")
            return
        }

        mDescription = mDescription.components(separatedBy: set).joined()
        mDescription = mDescription.trimmingCharacters(in: .whitespacesAndNewlines)
        guard var mPrice = estimatedPriceUITextField.text else {
            popAlert(title: "Description Too Short", message: pleaseFill, view: self)
            print("no price")
            return
        }

        mPrice = mPrice.trimmingCharacters(in: .whitespacesAndNewlines)
        mPrice = mPrice.trimmingCharacters(in: .symbols)
        if !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: mPrice)){
            popAlert(title: "Invalid Price", message: "please fill in only numbers", view: self)
            print("bad input in price")
            return
        }
        
        guard let myCondition = condition else {
            popAlert(title: "No Condition", message: pleaseFill, view: self)
            print("condition not selected")
            return
        }
        
        superviewUIView.isUserInteractionEnabled = false
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        let mProductsStorageRefNow = productsStorageRef.child("\(gOnlineUser.ID)/\(String(upTitle.prefix(5)))/pic.jpg")
        JustHUD.shared.showInView(view: self.superviewUIView, withHeader: "Loading", andFooter: "Please wait...")
        if didEditPic {
        guard let imageRefData = mImage2Upload else {
            print("no image")
            return
        }
            
        mProductsStorageRefNow.putData(imageRefData as Data, metadata: metadata) { ( meta, err) in
            mProductsStorageRefNow.downloadURL { (url, err) in
                guard let upURL = url else {
                    print("link error")
                    return}
                let mUpUrl =  "\(upURL)&token=397b7f94-d217-4cf6-8eef-27e4af33430e"
                var myNewProduct = ProductExpSQL(id: 0, userid: gOnlineUser.ID, title: upTitle, image: mUpUrl, description: mDescription, lastupdate: "", area: "", condition: myCondition, price: Int(mPrice)!)
                if self.edit {
                    myNewProduct.id = self.product!.ID
                    editProduct(myProductInSQL: myNewProduct, controller: self)
                } else {
                    pushProduct(uploadThis: myNewProduct, controller: self)
                }
            }
        }
            
        } else if edit{
            guard let inputThisProd = self.product else {return}
            let myEditedProduct = ProductExpSQL(id: inputThisProd.ID, userid: gOnlineUser.ID, title: upTitle, image: inputThisProd.image, description: mDescription, lastupdate: "", area: "", condition: myCondition, price: Int(mPrice)!)
            editProduct(myProductInSQL: myEditedProduct, controller: self)
        } else{
            backToMyStall()
        }
        
    }
    
    @IBAction func onclickDropdownConditionUIButton(_ sender: ConditionUIButton) {
        dropdownAnimation(toggle: conditionSelectionTableView.isHidden)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
  
    func dropdownAnimation(toggle: Bool){
        if toggle{
            UIView.animate(withDuration: 0.3) {
                self.conditionSelectionTableView.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.conditionSelectionTableView.isHidden = true
            }
        }
    }
    
    @IBAction func openPhotoLibrary(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        var actionSheet =  UIAlertController(title: "Photo Source", message: "Please choose which source", preferredStyle: .actionSheet)
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
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
//        var imagePicker = UIImagePickerController()
//        imagePicker.delegate = self
//        imagePicker.sourceType = .photoLibrary;
//        imagePicker.allowsEditing = true
//        present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    let image = info[UIImagePickerControllerOriginalImage] as! UIImage
    let compressedImage = resizeImage(image)
    addANewPhotoUIButton.setTitle("", for: .normal)
    addANewPhotoUIButton.setBackgroundImage(compressedImage, for: .normal)
        addANewPhotoUIButton.layer.cornerRadius = 20
        mImage2Upload = UIImageJPEGRepresentation(compressedImage, 1)! as NSData
    didEditPic = true
    picker.dismiss(animated: true, completion: nil)
}
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
}


    
    
    

    
//    @IBAction func maxPriceChangeAction(_ sender: PriceSliderUISlider) {
//        
//        let newPrice = Double(price)
//        let newValue = Double(sender.value)
//        if newValue < 0.0 {
//            maxPriceRangeUILabel.text = "max \(price)$"
//            return
//        } else if newValue > 1.0 {
//            maxPriceRangeUILabel.text = "Unlimited"
//return
//        }
//        let maxDisplay = Int(newPrice + (newValue * newPrice))
//        maxPriceRangeUILabel.text = "max \(maxDisplay)$"
//        
//    }
//    
//    @IBAction func minPriceChangeAction(_ sender: PriceSliderUISlider) {
//        let newPrice = Double(price)
//        let newValue = Double(sender.value)
//        if newValue < 0.0{
//            minPriceRangeUILabel.text = "any price"
//return
//        } else if newValue > 1.0 {
//            minPriceRangeUILabel.text = "min \(price)$"
//            return
//        }
//        let maxDisplay = Int(newPrice * newValue)
//        minPriceRangeUILabel.text = "min \(maxDisplay)$"
//    }
    
}

extension EditMyProductsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conditionListing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = conditionSelectionTableView.dequeueReusableCell(withIdentifier: "conditionChoiceCell", for: indexPath) as! ConditionSelectionTableViewCell
        cell.selectionStyle = .none
        cell.conditionNameUIButton.isEnabled = false
        cell.conditionNameUIButton.setTitle("\(conditionListing[indexPath.row])",for: .disabled)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dropDownConditionUIButton.setTitle("\(conditionListing[indexPath.row])", for: .normal)
        dropdownAnimation(toggle: conditionSelectionTableView.isHidden)
        condition = indexPath.row
    }
    
}


//        if let imgUrl = info[UIImagePickerControllerImageURL] as? URL{
//            let imgName = imgUrl.lastPathComponent
//            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
//            let localPath = documentDirectory?.appending(imgName)
//
//            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
//            let data = UIImagePNGRepresentation(image)! as NSData
//            data.write(toFile: localPath!, atomically: true)
//            //let imageData = NSData(contentsOfFile: localPath!)!
//            let photoURL = URL.init(fileURLWithPath: localPath!)//NSURL(fileURLWithPath: localPath!)
//            mImageURL = photoURL
//
//
//        }

