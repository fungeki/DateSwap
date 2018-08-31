//
//  PrivateChatViewController.swift
//  DateSwap
//
//  Created by Dor tzemach on 31/08/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class PrivateChatViewController: UIViewController {

    @IBOutlet weak var tablePrivateChatUITableView: UITableView!
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        tablePrivateChatUITableView.estimatedRowHeight = 44.0
        tablePrivateChatUITableView.rowHeight = UITableViewAutomaticDimension

        // Do any additional setup after loading the view.
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
        cell.messagePrivateChatEditableLableUILable.layer.masksToBounds = true
        cell.profileLeftSenderConditionUIButton.layer.masksToBounds = true
        cell.messagePrivateChatEditableLableUILable.layer.cornerRadius = 20
        cell.profileLeftSenderConditionUIButton.layer.cornerRadius = cell.profileLeftSenderConditionUIButton.frame.height/1.72
        
        if (modelMsg.senderID == "5"){
            cell.messagePrivateChatEditableLableUILable.layer.backgroundColor = lightOrangeOpacityManual(alphaColor: 0.40)
            cell.profileLeftSenderConditionUIButton.isHidden = true
        }else{
            cell.messagePrivateChatEditableLableUILable.layer.backgroundColor = grayTwo()
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


