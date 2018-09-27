//
//  CategoriesViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 27/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var CategoriesUITable: UITableView!
    let categoryImg = [#imageLiteral(resourceName: "ic_toys"), #imageLiteral(resourceName: "ic_books"), #imageLiteral(resourceName: "ic_garage"), #imageLiteral(resourceName: "ic_hobbies"), #imageLiteral(resourceName: "ic_clothing"), #imageLiteral(resourceName: "ic_family"), #imageLiteral(resourceName: "ic_home")]
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoriesUITable.rowHeight = 62
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Category.allValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoriesCell") as! CategoriesTableViewCell
        cell.categoryImageUIImage.image = categoryImg[indexPath.row]
        cell.categoryNameUILabel.text = Category.allValues[indexPath.row].rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gSelectedCategory = Category.allValues[indexPath.row].rawValue
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "category"), object: self)
        dismiss(animated: true)
    }
}
