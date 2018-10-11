//
//  EditMyProductsViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 21/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit
import FirebaseStorage

class EditMyProductsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate, UITextFieldDelegate {
    var price: Int = 0
    
    fileprivate var longPressGesture: UILongPressGestureRecognizer!

    @IBOutlet weak var imageUICV: UICollectionView!
    @IBOutlet weak var estimatedPriceUITextField: ProductEditTextfield!
    var mKeyboardSize: CGRect?
//    var wasKeyEdited = false
    var edit = false
    var didEditPic = false
    var isAdditionalPhotosEnabled = false
    var numOfCellSelected = 0
    var imagePlaceholderArray = [#imageLiteral(resourceName: "card_empty_dark"), #imageLiteral(resourceName: "card_empty_dark"), #imageLiteral(resourceName: "card_empty_dark"), #imageLiteral(resourceName: "card_empty_dark")]
    var testing = [0,1,2,3]
    
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
//    @IBOutlet weak var addANewPhotoUIButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    var product: Product?
    var locationOfProduct : Int?
    var pageHeader: String!
    var conditionListing = returnConditionArray()
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongGesture(gesture:)))
        imageUICV.addGestureRecognizer(longPressGesture)
//        toolbarsInit()
        initialize()
        
        dropDownConditionUIButton.layer.cornerRadius = dropDownConditionUIButton.frame.height/2
        dropDownConditionUIButton.layer.masksToBounds = true
        
       
        
        // Do any additional setup after loading the view.
    }
    func endEditing() {
        self.descriptionUITextView.endEditing(true)
        self.productTitleUITextField.endEditing(true)
        self.estimatedPriceUITextField.endEditing(true)
    }
//    @objc func doneClick(){
//
//        if self.view.frame.origin.y != 0 {
//            guard let keyboard = mKeyboardSize else {return}
//            self.view.frame.origin.y += keyboard.height
//        }
//        view.endEditing(true)
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
       
        productTitleUITextField.layer.cornerRadius = productTitleUITextField.frame.size.height/2
        productTitleUITextField.layer.masksToBounds = true
        
        estimatedPriceUITextField.layer.cornerRadius = estimatedPriceUITextField.frame.size.height/2
        estimatedPriceUITextField.layer.masksToBounds = true
        
        estimatedPriceUITextField.attributedPlaceholder = NSAttributedString(string: "Estimated Price",attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        
        
    }
    @objc func handleLongGesture(gesture: UILongPressGestureRecognizer) {
        switch(gesture.state) {
            
        case .began:
            guard let selectedIndexPath = imageUICV.indexPathForItem(at: gesture.location(in: imageUICV)) else {
                break
            }
            imageUICV.beginInteractiveMovementForItem(at: selectedIndexPath)
        case .changed:
            imageUICV.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
        case .ended:
            imageUICV.endInteractiveMovement()
        default:
            imageUICV.cancelInteractiveMovement()
        }
    }

//    @objc func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0{
//                self.view.frame.origin.y -= keyboardSize.height
//            }
//            if !wasKeyEdited{
//            mKeyboardSize = keyboardSize
//            wasKeyEdited = true
//            }
//        }
//
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y != 0{
//                self.view.frame.origin.y += keyboardSize.height
//            }
//        }
//    }
    //change colors HERE //and the initialize
    
//    func toolbarsInit(){
//        NotificationCenter.default.addObserver(self, selector: #selector(EditMyProductsViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(EditMyProductsViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
//        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClick))
//        toolbar.setItems([flexibleSpace, doneButton], animated: true)
//        descriptionUITextView.inputAccessoryView = toolbar
//        productTitleUITextField.inputAccessoryView = toolbar
//        estimatedPriceUITextField.inputAccessoryView = toolbar
//    }
    
    func initialize (){
        descriptionUITextView.delegate = self
//        descriptionUITextView.layer.borderColor = brown()
//        productTitleUITextField.layer.borderColor = brown()
//        descriptionUITextView.layer.borderWidth = 4
        productTitleUITextField.delegate = self
        estimatedPriceUITextField.delegate = self
        
        headerLabel.text = pageHeader
        conditionSelectionTableView.isHidden = true
        guard let inputThisProduct = product else {
            self.descriptionUITextView.text = placeholerDescription
            self.descriptionUITextView.textColor = UIColor(cgColor: placeholerColor())
            return}
        edit = true
        let conditionVal = inputThisProduct.condition
        condition = conditionVal.rawValue
        productTitleUITextField.text = inputThisProduct.title
        estimatedPriceUITextField.text = inputThisProduct.price
        descriptionUITextView.text = inputThisProduct.description
        dropDownConditionUIButton.setTitle(returnCondition(inputThisProduct.condition), for: .normal)
//        addANewPhotoUIButton.setTitle("", for: .normal)
        //        addANewPhotoUIButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
//        addANewPhotoUIButton.sd_setBackgroundImage(with: URL(string: inputThisProduct.image), for: .normal)
//        addANewPhotoUIButton.layer.cornerRadius = 20
//        price = (inputThisProduct.price as NSString).integerValue
        if descriptionUITextView.text.count == 0{
            //descriptionUITextView.textColor = UIColor.lightGray
            descriptionUITextView.text = placeholerDescription
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholerDescription
            textView.textColor = UIColor(cgColor: placeholerColor())
        }
        
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.view.endEditing(true)
//        return false
//    }
    func backToMyStall(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "onlineUserStall") as! ProductOverviewViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    @IBAction func SaveProduct(_ sender: Any) {
        
        let pleaseFill = "Please fill in all the fields"
        let set =  charSetForInput.inverted
        if !edit && !didEditPic {
            popAlert(title: "No Photo", message: pleaseFill, view: self)
            print("product photo empty")
            return
        }
        guard let tempTitle = productTitleUITextField.text else {
            popAlert(title: "No Title", message: pleaseFill, view: self)
            print("product title text field empty")
            return
        }
        
        let trimmedString = tempTitle.trimmingCharacters(in: .whitespacesAndNewlines)
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
            popAlert(title: "No Price", message: pleaseFill, view: self)
            print("no price")
            return
        }
        
        mPrice = mPrice.trimmingCharacters(in: .whitespacesAndNewlines)
        // mPrice = mPrice.trimmingCharacters(in: .symbols)
        if !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: mPrice)){
            popAlert(title: "Invalid Price", message: "please fill in only numbers", view: self)
            print("bad input in price")
            return
        }
        guard let mUpPrice = Int(mPrice) else {
            popAlert(title: "Invalid Price", message: "Without a fraction", view: self)
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
        if didEditPic{
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
                    var myNewProduct = ProductExpSQL(id: 0, userid: gOnlineUser.ID, title: upTitle, image: mUpUrl, description: mDescription, lastupdate: "", area: "", condition: myCondition, price: mUpPrice, category: -1)
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
            let myEditedProduct = ProductExpSQL(id: inputThisProd.ID, userid: gOnlineUser.ID, title: upTitle, image: inputThisProd.image, description: mDescription, lastupdate: "", area: "", condition: myCondition, price: mUpPrice, category: -1)
            editProduct(myProductInSQL: myEditedProduct, controller: self)
        } else{
            backToMyStall()
        }
        
    }
    
    @IBAction func onclickDropdownConditionUIButton(_ sender: ConditionUIButton) {
        endEditing()
        dropdownAnimation(toggle: conditionSelectionTableView.isHidden)
    }
    
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
    
    func openPhotoLibrary(imageNum: Int) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let cell = self.imageUICV.cellForItem(at: IndexPath(item: self.numOfCellSelected, section: 0)) as! AddImageCollectionViewCell
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
        if imageNum > 0 && imagePlaceholderArray[imageNum] != #imageLiteral(resourceName: "card_empty_dark"){
            actionSheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
                self.imagePlaceholderArray[imageNum] = #imageLiteral(resourceName: "card_empty_dark")
                self.imageUICV.reloadData()
//                let mainCell = self.imageUICV.cellForItem(at: IndexPath(item: self.numOfCellSelected, section: 0)) as! AddImageCollectionViewCell
//                guard let mainImage = mainCell.itemImageUIImage.image?.cgImage?.copy() else {
//                    return
//                }
//                let newMainImage = UIImage(cgImage: mainImage, scale: mainCell.itemImageUIImage.image!.scale, orientation: mainCell.itemImageUIImage.image!.imageOrientation)
//                guard let cellImage = cell.itemImageUIImage.image?.cgImage?.copy() else {
//                    return
//                }
//                let newCellImage = UIImage(cgImage: cellImage, scale: cell.itemImageUIImage.image!.scale, orientation: cell.itemImageUIImage.image!.imageOrientation)
//                self.imagePlaceholderArray[self.numOfCellSelected] = mainCell.storedImage
//                self.imagePlaceholderArray[0] = cell.storedImage
//                self.imageUICV.reloadData()


            }))
        }
        actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: { (action) in
            
        }))
        self.present(actionSheet, animated: true) {
            
        }
        
    }
    
   @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        let compressedImage = resizeImage(image)
        let cell = imageUICV.cellForItem(at: IndexPath(item: numOfCellSelected, section: 0)) as! AddImageCollectionViewCell
    cell.itemImageUIImage.image = compressedImage
        cell.isFull = true
        if numOfCellSelected == 0 {
            isAdditionalPhotosEnabled = true
        }
    imagePlaceholderArray[numOfCellSelected] = compressedImage
//        addANewPhotoUIButton.setTitle("", for: .normal)
//        addANewPhotoUIButton.setBackgroundImage(compressedImage, for: .normal)
//        addANewPhotoUIButton.layer.cornerRadius = 20
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

extension EditMyProductsViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imagesCell", for: indexPath) as! AddImageCollectionViewCell
        cell.itemImageUIImage.image = imagePlaceholderArray[indexPath.item]
        cell.itemImageUIImage.layer.cornerRadius = 20
        cell.itemImageUIImage.addJeansEffect(color: lightOrange(), cornerRadius: 20, lineWidth: 2, lineDashPattern: [9,9])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0{
           return CGSize(width: self.imageUICV.frame.width, height: self.imageUICV.frame.height * (2.0 / 3.0))
        }
        return CGSize(width: self.view.frame.width / 3 - 1, height: self.imageUICV.frame.height * (1.0 / 3.0))
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        endEditing()
        if indexPath.item > 0 && !isAdditionalPhotosEnabled{
            popAlert(title: "No Main Image", message: "Please make sure to have a main image", view: self)
            return
        }
        numOfCellSelected = indexPath.item
        print("cell selected : \(numOfCellSelected)")
        openPhotoLibrary(imageNum: indexPath.item)
    }
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = imagePlaceholderArray[sourceIndexPath.item]
        imagePlaceholderArray.remove(at: sourceIndexPath.item)
        imagePlaceholderArray.insert(item, at: destinationIndexPath.item)
        if imagePlaceholderArray[0] == #imageLiteral(resourceName: "card_empty_dark") {
            isAdditionalPhotosEnabled = false
        }
    }
//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        if indexPath.row > 0 {
//            return true
//        }
//        return false
//    }
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let item = tableView
//    }
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
//    @objc func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0{
//                self.view.frame.origin.y -= keyboardSize.height
//            }
//        }
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y != 0{
//                self.view.frame.origin.y += keyboardSize.height
//            }
//        }
//    }
//        NotificationCenter.default.addObserver(self, selector: #selector(EditMyProductsViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(EditMyProductsViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
//        tap.cancelsTouchesInView = false
//        descriptionUITextView.addGestureRecognizer(tap)
//        maxPriceUISlider.maximumTrackTintColor  = UIColor.init(cgColor: grayTwo())
//        minPriceUISlider.minimumTrackTintColor = UIColor.init(cgColor: grayTwo())
//        minPriceUISlider.maximumTrackTintColor = UIColor.init(cgColor: mediumOrange())
//        minPriceUISlider.thumbTintColor = UIColor.init(cgColor: mediumOrange())
//        maxPriceUISlider.minimumTrackTintColor = UIColor.init(cgColor: mediumOrange())
//        maxPriceUISlider.thumbTintColor = UIColor.init(cgColor: mediumOrange())
//    @IBAction func toPrice(_ sender: ProductEditTextfield) {
//        guard let newPrice = sender.text else {return}
//        price = (newPrice as NSString).integerValue
//        sender.text = "\(String(describing: sender.text))$"
//    }
//
//    //Calls this function when the tap is recognized.
//    func dismissKeyboard() {
//    //Causes the view (or one of its embedded text fields) to resign the first responder status.
//        descriptionUITextView.endEditing(true)
//        productTitleUITextField.endEditing(true)
//        estimatedPriceUITextField.endEditing(true)
//    }


