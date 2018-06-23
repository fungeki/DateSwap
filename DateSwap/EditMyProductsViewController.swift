//
//  EditMyProductsViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 21/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class EditMyProductsViewController: UIViewController {

    @IBOutlet weak var conditionSelectionTableView: UITableView!
    @IBOutlet weak var dropDownConditionUIButton: ConditionUIButton!
    @IBOutlet weak var addANewPhotoUIButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    var product: Product?
    var pageHeader: String!
    
    var conditionListing = returnConditionArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = pageHeader
        conditionSelectionTableView.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        addANewPhotoUIButton.addJeansEffect(darkOrange())
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
extension EditMyProductsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conditionListing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = conditionSelectionTableView.dequeueReusableCell(withIdentifier: "conditionChoiceCell", for: indexPath)
        cell.textLabel?.text = conditionListing[indexPath.row]
        cell.selectionStyle = .none
        cell.layer.cornerRadius = 10
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dropDownConditionUIButton.setTitle("\(conditionListing[indexPath.row])", for: .normal)
        dropdownAnimation(toggle: conditionSelectionTableView.isHidden)
    }
    
}
