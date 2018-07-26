//
//  ChatTableViewCell.swift
//  DateSwap
//
//  Created by Ran Loock on 20/07/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var messageUITextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
