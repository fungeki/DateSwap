//
//  CategorySelectionViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 26/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class CategorySelectionViewController: UIViewController {

    @IBOutlet weak var categoriesUITable: UITableView!
    let imageArray = [#imageLiteral(resourceName: "ic_toys"), #imageLiteral(resourceName: "ic_books"), #imageLiteral(resourceName: "ic_garage"), #imageLiteral(resourceName: "ic_hobbies"), #imageLiteral(resourceName: "ic_clothing"), #imageLiteral(resourceName: "ic_family"), #imageLiteral(resourceName: "ic_home")]
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesUITable.rowHeight = 62
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}

extension CategorySelectionViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Category.allValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as! CategorySelectionTableViewCell
        cell.categoryUILabel.text = Category.allValues[indexPath.row].rawValue
        cell.categoryImageUIImage.image = imageArray[indexPath.row]
        return cell
    }
    
    
}
