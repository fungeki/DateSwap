//
//  EditMyProductsViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 21/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class EditMyProductsViewController: UIViewController {
    var price: Int = 0
    @IBAction func toPrice(_ sender: ProductEditTextfield) {
        guard let newPrice = sender.text else {return}
        price = (newPrice as NSString).integerValue
        sender.text = "\(String(describing: sender.text))$"
    }
    @IBOutlet weak var estimatedPriceUITextField: ProductEditTextfield!
    
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
        productTitleUITextField.text = inputThisProduct.title
        estimatedPriceUITextField.text = inputThisProduct.price
        productDescriptionUITextView.text = inputThisProduct.description
        dropDownConditionUIButton.setTitle(returnCondition(inputThisProduct.condition), for: .normal)
        addANewPhotoUIButton.setTitle("", for: .normal)
        print(inputThisProduct.image)
        addANewPhotoUIButton.sd_setBackgroundImage(with: URL(string: inputThisProduct.image), for: .normal)
        addANewPhotoUIButton.layer.cornerRadius = 20
        price = (inputThisProduct.price as NSString).integerValue
        productDescriptionUITextView.textColor = UIColor.brown
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
