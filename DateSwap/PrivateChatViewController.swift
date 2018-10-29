//
//  PrivateChatViewController.swift
//  DateSwap
//
//  Created by Dor tzemach on 31/08/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class PrivateChatViewController: UIViewController {
        var countMessage = 0

    @IBOutlet weak var hisImageUIView: UIImageView!
    @IBOutlet weak var myItemUIImage: UIImageView!
    @IBOutlet weak var tablePrivateChatUITableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablePrivateChatUITableView.estimatedRowHeight = 44.0
        tablePrivateChatUITableView.rowHeight = UITableViewAutomaticDimension
        
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        hisImageUIView.layer.cornerRadius = 20
        myItemUIImage.layer.cornerRadius = 20
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PrivateChatViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "privateChatCell") as! PrivateChatTableViewCell
        
    
        
        let modelMsg = messages[indexPath.row]
        cell.messagePrivateChatEditableLableUILable.text = modelMsg.text
        cell.messagePrivateChatEditableLableUILable.numberOfLines = 0
//        cell.messagePrivateChatEditableLableUILable.layer.masksToBounds = true
//        cell.profileLeftSenderConditionUIButton.layer.masksToBounds = true
//        cell.messagePrivateChatEditableLableUILable.layer.cornerRadius = 20
        cell.profileLeftSenderConditionUIButton.layer.cornerRadius = cell.profileLeftSenderConditionUIButton.frame.height/2
        cell.selectionStyle = .none
        
        if (modelMsg.senderID == "5"){
           
            cell.messagePrivateChatEditableLableUILable.layer.backgroundColor = lightOrangeOpacityManual(alphaColor: 0.40)
            cell.profileLeftSenderConditionUIButton.isHidden = true
//            cell.messagePrivateChatEditableLableUILable.roundCorners(corners: [.topLeft, .topRight, .bottomLeft], radius: 20)
//
            cell.isItMe = true
        }else{
             //countMessage = countMessage + 1
            cell.messagePrivateChatEditableLableUILable.layer.backgroundColor = grayTwo()
            //if (countMessage > 1  ){
                cell.profileLeftSenderConditionUIButton.isHidden = true
                countMessage = 0
            cell.isItMe = false
           // }
       
//            cell.messagePrivateChatEditableLableUILable.roundCorners(corners: [.topLeft, .topRight, .bottomRight], radius: 20)
        }
        
        return cell
    }
    
    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


