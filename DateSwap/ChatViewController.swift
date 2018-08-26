//
//  ChatViewController.swift
//  DateSwap
//
//  Created by Dor tzemach on 20/08/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var tableChatUITableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        tableChatUITableView.estimatedRowHeight = 44.0
        tableChatUITableView.rowHeight = UITableViewAutomaticDimension
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension ChatViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell") as! ChatTableViewCell
        
        let modelMsg = messages[indexPath.row]
        //cell.chatTextUILabel.isEnabled = false
        cell.chatTextUILabel.text = modelMsg.text
        cell.chatTextUILabel.numberOfLines = 0
        cell.chatTextUILabel.layer.masksToBounds = true
        cell.profileImageConditionButton.layer.masksToBounds = true
        cell.chatTextUILabel.layer.cornerRadius = 20
        cell.profileImageConditionButton.layer.cornerRadius = cell.profileImageConditionButton.frame.height/1.72
        
        if (modelMsg.senderID == "5"){
            cell.chatTextUILabel.layer.backgroundColor = lightOrangeOpacityManual(alphaColor: 0.4)
            cell.leftSideNSLayoutConstraint.isActive = false
            cell.rightSideNSLayoutConstraint.isActive = false
            cell.profileImageConditionButton.isHidden = true
       
        }else{
            cell.chatTextUILabel.layer.backgroundColor = grayTwo()
            cell.leftSideSenderNSLayoutConstraint.isActive = false
            cell.rightSideSenderNSLayoutConstraint.isActive = false
//            cell.chatTextUILabel.translatesAutoresizingMaskIntoConstraints = false
//            cell.chatTextUILabel.trailingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor, constant: 8)
                
            

        }
        
        //first test to change color

//        if ( messages.filter{$0.senderID == "5"}.count > 0){
//            cell.chatTextUILabel.layer.backgroundColor = lightOrangeOpacityManual(alphaColor: 0.4)
//        }else{
//             cell.chatTextUILabel.layer.backgroundColor = lightOrangeOpacityManual(alphaColor: 1)
//        }
        

        
        

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


