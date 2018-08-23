//
//  ChatTableViewCell.swift
//  DateSwap
//
//  Created by Dor tzemach on 20/08/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

//    @IBOutlet weak var rightSideNSLayoutConstraint: NSLayoutConstraint!
//    @IBOutlet weak var leftSideNSLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var profileImageConditionButton: ConditionUIButton!
    @IBOutlet weak var chatTextUILabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
