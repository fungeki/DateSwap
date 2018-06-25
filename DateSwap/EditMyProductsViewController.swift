//
//  EditMyProductsViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 21/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class EditMyProductsViewController: UIViewController {
    @IBOutlet weak var maxPriceUISlider: PriceSliderUISlider!
    @IBOutlet weak var minPriceUISlider: PriceSliderUISlider!
    
    
    @IBOutlet weak var maxPriceRangeUILabel: UILabel!
    @IBOutlet weak var minPriceRangeUILabel: UILabel!
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
    @IBAction func maxSliderChangeAction(_ sender: PriceSliderUISlider) {

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        addANewPhotoUIButton.addJeansEffect(darkOrange())
       
        
    }
   
    //change colors HERE //and the initialize
    func initialize (){
        maxPriceUISlider.maximumTrackTintColor  = UIColor.init(cgColor: grayTwo())
        minPriceUISlider.minimumTrackTintColor = UIColor.init(cgColor: grayTwo())
        minPriceUISlider.maximumTrackTintColor = UIColor.init(cgColor: mediumOrange())
        minPriceUISlider.thumbTintColor = UIColor.init(cgColor: mediumOrange())
        maxPriceUISlider.minimumTrackTintColor = UIColor.init(cgColor: mediumOrange())
        maxPriceUISlider.thumbTintColor = UIColor.init(cgColor: mediumOrange())
        headerLabel.text = pageHeader
        conditionSelectionTableView.isHidden = true
        guard let inputThisProduct = product else {return}
        productTitleUITextField.text = inputThisProduct.title
        estimatedPriceUITextField.text = inputThisProduct.price
        productDescriptionUITextView.text = inputThisProduct.description
        dropDownConditionUIButton.setTitle(returnCondition(inputThisProduct.condition), for: .normal)
        addANewPhotoUIButton.setTitle("", for: .normal)
        addANewPhotoUIButton.sd_setImage(with: URL(string: inputThisProduct.image), for: UIControlState.normal)
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
