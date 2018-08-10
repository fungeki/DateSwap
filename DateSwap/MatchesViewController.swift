//
//  MatchesViewController.swift
//  DateSwap
//
//  Created by Dor tzemach on 17/07/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class MatchesViewController: UIViewController {

    

    @IBOutlet weak var msgsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
msgsTableView.rowHeight = 135
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

extension MatchesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell") as! MessagesTableViewCell
        let msg = messages[indexPath.row]
        let product = products[indexPath.row]
        cell.headerUILabel.text = product.title
        cell.descriptionUILabel.text = msg.text
        cell.itemUserMessagesUIImageView.sd_setImage(with: URL(string: product.image))
        cell.itemUserMessagesUIImageView.layer.cornerRadius = 20
        cell.itemUserMessagesUIImageView.clipsToBounds = true
      
        cell.messagesConditionUIButton.isEnabled = false
        cell.messagesConditionUIButton.setTitle(returnCondition(product.condition), for: .disabled)
        return cell
    }
}

extension MatchesViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewMatchesCollectionViewCell", for: indexPath) as! NewMatchesCollectionViewCell
        let profile = profiles[indexPath.row]
        
        
        cell.newMatchUIImageView.sd_setImage(with: URL(string: profiles[indexPath.row].pic))
        cell.newMatchUIImageView.layer.cornerRadius = 20
        cell.newMatchNickNameUILabel.text = profile.nickname
        return cell
    }
    
    
}


