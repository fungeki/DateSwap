//
//  EditMyProductsViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 21/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit
import FirebaseStorage

class EditMyProductsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var price: Int = 0
    @IBAction func toPrice(_ sender: ProductEditTextfield) {
        guard let newPrice = sender.text else {return}
        price = (newPrice as NSString).integerValue
        sender.text = "\(String(describing: sender.text))$"
    }
    @IBOutlet weak var estimatedPriceUITextField: ProductEditTextfield!
    
    var edit : Bool?
    var didEditPic = false
    
    var mImage2Upload : NSData?
    var mTitle : String?
    var mDescription: String?
    var mCondition : Int?
    var mPrice : Int?
    var condition : Int?

    @IBOutlet weak var productDescriptionUITextView: DescriptionUITextView!
    @IBOutlet weak var productTitleUITextField: UITextField!
    
    @IBOutlet weak var dropDownMenu: UIStackView!
    @IBOutlet weak var conditionSelectionTableView: UITableView!
    @IBOutlet weak var dropDownConditionUIButton: ConditionUIButton!
    @IBOutlet weak var addANewPhotoUIButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    var product: Product?
    var pageHeader: String!
    var conditionListing = returnConditionArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        if edit == nil {
            edit = false
        }
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
//        maxPriceUISlider.maximumTrackTintColor  = UIColor.init(cgColor: grayTwo())
//        minPriceUISlider.minimumTrackTintColor = UIColor.init(cgColor: grayTwo())
//        minPriceUISlider.maximumTrackTintColor = UIColor.init(cgColor: mediumOrange())
//        minPriceUISlider.thumbTintColor = UIColor.init(cgColor: mediumOrange())
//        maxPriceUISlider.minimumTrackTintColor = UIColor.init(cgColor: mediumOrange())
//        maxPriceUISlider.thumbTintColor = UIColor.init(cgColor: mediumOrange())
        headerLabel.text = pageHeader
        conditionSelectionTableView.isHidden = true
        guard let inputThisProduct = product else {return}
        edit = true
        productTitleUITextField.text = inputThisProduct.title
        estimatedPriceUITextField.text = inputThisProduct.price
        productDescriptionUITextView.text = inputThisProduct.description
        dropDownConditionUIButton.setTitle(returnCondition(inputThisProduct.condition), for: .normal)
        addANewPhotoUIButton.setTitle("", for: .normal)
//        addANewPhotoUIButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        addANewPhotoUIButton.sd_setBackgroundImage(with: URL(string: inputThisProduct.image), for: .normal)
        addANewPhotoUIButton.layer.cornerRadius = 20
        price = (inputThisProduct.price as NSString).integerValue
        productDescriptionUITextView.textColor = UIColor.brown
    }
    
    @IBAction func SaveProduct(_ sender: Any) {
        guard let mEdit = edit else {
            return
        }
        guard let imageRefData = mImage2Upload else {
            print("no image")
            return
        }
        guard let tempTitle = productTitleUITextField.text else {
            print("product title text field empty")
            return
        }
        var trimmedString = tempTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        trimmedString = trimmedString.trimmingCharacters(in: .illegalCharacters)
        trimmedString = trimmedString.trimmingCharacters(in: .punctuationCharacters)
        if trimmedString.count < 5 {
            print("name too short")
            return
        }
        if trimmedString.count > 100 {
            print("name too long")
            return
        }
        mTitle = trimmedString
        guard var upTitle = mTitle else {
            print("no title!")
            return
        }
        guard var mDescription = productDescriptionUITextView.text else {
            print("no description")
            return
        }
        mDescription = mDescription.trimmingCharacters(in: .whitespacesAndNewlines)
        guard var mPrice = estimatedPriceUITextField.text else {
            print("no price")
            return
        }
        mPrice = mPrice.trimmingCharacters(in: .whitespacesAndNewlines)
        mPrice = mPrice.trimmingCharacters(in: .symbols)
        if !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: mPrice)){
            print("bad input in price")
            return
        }
        guard let mCondition = condition else {
            print("condition not selected")
            return
        }
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        let mProductsStorageRefNow = productsStorageRef.child("\(gOnlineUser.ID)/\(String(upTitle.prefix(5)))/pic.jpg")
        if didEditPic {
        mProductsStorageRefNow.putData(imageRefData as Data, metadata: metadata) { ( meta, err) in
            mProductsStorageRefNow.downloadURL { (url, err) in
                guard let upURL = url else {
                    print("link error")
                    return}
                let mUpUrl =  "\(upURL)&token=397b7f94-d217-4cf6-8eef-27e4af33430e"
                var myNewProduct = ProductExpSQL(id: 0, userid: gOnlineUser.ID, title: upTitle, image: mUpUrl, description: mDescription, lastupdate: "", area: "", condition: mCondition, price: Int(mPrice)!)
                if mEdit {
                    myNewProduct.id = self.product!.ID
                    editProduct(myProductInSQL: myNewProduct)
                } else {
                    pushProduct(uploadThis: myNewProduct)
                }
            }
        }
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
    mImage2Upload = UIImageJPEGRepresentation(compressedImage, 1) as! NSData
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

extension EditMyProductsViewController: UITableViewDelegate, UITableViewDataSource, UITextViewDelegate{
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
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if (textView.text == "Enter your date (product) description here...")
        {
            textView.text = ""
            textView.textColor = .black
        }
        textView.becomeFirstResponder() //Optional
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView)
    {
        if (textView.text == "")
        {
            textView.text = "Enter your date (product) description here..."
            textView.textColor = .lightGray
        }
        textView.resignFirstResponder()
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


