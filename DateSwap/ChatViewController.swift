//
//  ChatViewController.swift
//  DateSwap
//
//  Created by Ran Loock on 20/07/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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

extension ChatViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell") as! ChatTableViewCell
        let msg = messages[indexPath.row]
        cell.messageUITextView.text = msg.text
        var mColor = UIColor.blue
        if msg.senderID == "1"{
            let mColor = UIColor.green
        }
        cell.messageUITextView.backgroundColor = mColor
        cell.messageUITextView.layer.cornerRadius = 20
        return cell
    }
    
    
}
