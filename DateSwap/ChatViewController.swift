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
  //      tableChatUITableView.rowHeight = UITableViewAutomaticDimension
        //tableChatUITableView.estimatedRowHeight = UITableViewAutomaticDimension
        
        
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        

        return 300

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell") as! ChatTableViewCell
        
        let modelMsg = messages[indexPath.row]
        //cell.chatTextUILabel.isEnabled = false
        cell.chatTextUILabel.text = modelMsg.text
        cell.chatTextUILabel.numberOfLines = 0
        cell.chatTextUILabel.layer.masksToBounds = true
      //  cell.chatTextUILabel.layer.cornerRadius = 20
        
        
        
        //cell.chatTextUILabel.setTitle(modelMsg.text, for: .disabled)
        //cell.leftSideTextNSLayoutConstraint.constant = 80
        //cell.chatTextConditionUIButton.roundMyChatCorners(radius: 20)
        

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


