//
//  OverviewNotificationViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 08/10/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class OverviewNotificationViewController: UIViewController {

    @IBOutlet weak var chatsTable: UITableView!
    
    @IBOutlet weak var chatExpensionUIButton: ConditionUIButton!
    @IBOutlet weak var itemNotificationUILabel: UILabel!
    
    var notifications = [Notification]()
    @IBOutlet weak var notificationTable: UITableView!
    var isChatFull = false
    var chatsAmount = 2
    var notificationAmount = gOnlineUserProducts.count
//    var relationHeight: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        JustHUD.shared.showInView(view: self.view, withHeader: "Loading", andFooter: "Please wait")
        GetMyNotifications { (res) in
            JustHUD.shared.hide()
            self.notifications = res
            self.notificationTable.reloadData()
            print(self.notifications)
        }
//        let realOrigin = self.view.convert(chatsTable.frame.origin, to: self.view)
//         let heightOrigin = view.frame.maxY - (chatsTable.frame.height + realOrigin.y)
//        relationHeight = (heightOrigin + chatsTable.frame.height) / chatsTable.frame.height
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chatsToggle(_ sender: Any) {
        isChatFull = !isChatFull
        enlargeEffect()
    }
    
    func enlargeEffect(){
        if isChatFull {
            chatsAmount = 10
            chatsTable.reloadData()
            chatExpensionUIButton.setTitle("Less Chats", for: .normal)
            UIView.animate(withDuration: 0.3, delay: 0, animations: {
                let effect = CGAffineTransform(translationX: 0, y: self.notificationTable.frame.height + 30)
                self.notificationTable.transform = effect
                self.itemNotificationUILabel.transform = effect
            }, completion: { (true) in
//                self.notificationAmount = 0
                self.notificationTable.isHidden = true
            })
        } else {
          //  self.notificationAmount = 5
            self.notificationTable.isHidden = false
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveLinear, animations: {
                let effect = CGAffineTransform(translationX: 0, y: 0)
                self.notificationTable.transform = effect
                self.itemNotificationUILabel.transform = effect
            }, completion: { (true) in
                self.chatsAmount = 2
                self.chatExpensionUIButton.setTitle("More Chats", for: .normal)
                self.chatsTable.reloadData()
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toItemNotificationSegue" {
            let vc = segue.destination as! ProductNotificationViewController
            vc.myNotification = sender as! Notification
            
        }
    }

}
extension OverviewNotificationViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return self.chatsAmount
        }
        return notificationAmount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //for chats tableview:
        if tableView.tag == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "chatsCell", for: indexPath) as! ChatsOverviewTableViewCell
            cell.hisImageUIimage.layer.cornerRadius = 20
            cell.myItemUIImageView.layer.cornerRadius = 20
            return cell
        }
        
        //for product table
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as! ProductsNotificationTableViewCell
        cell.chatsNotificationLabel.layer.cornerRadius = cell.chatsNotificationLabel.frame.height / 2.0
        cell.offersNotifiactionLabel.layer.cornerRadius = cell.offersNotifiactionLabel.frame.height / 2.0
        cell.matchesNotificationsLabel.layer.cornerRadius = cell.matchesNotificationsLabel.frame.height / 2.0
        
        if notifications.count == 0 {
            return cell
        }
        let notificationModel = notifications[indexPath.row]
        let offersModel = notificationModel.offers
        var offersCount = 0
        var matchesCount = 0
        for offer in offersModel {
            switch offer.status{
            case 0:
                offersCount += 1
                break
            case 2:
                matchesCount += 1
                break
            default:
                break
            }
        }
        cell.matchesNotificationsLabel.text = "\(matchesCount)"
        cell.offersNotifiactionLabel.text = "\(offersCount)"
        cell.offers = offersModel
        cell.prodTitle = notificationModel.title
        cell.myItemUIImageView.sd_setImage(with: URL(string: notificationModel.image))
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag != 0{  //produt table
        let notificationToCheck = notifications[indexPath.row]
        performSegue(withIdentifier: "toItemNotificationSegue", sender: notificationToCheck)
        }
    }
    
}
