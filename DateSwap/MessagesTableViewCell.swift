//
//  MessagesTableViewCell.swift
//  DateSwap
//
//  Created by Dor tzemach on 20/07/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class MessagesTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionUILabel: UILabel!
    @IBOutlet weak var headerUILabel: UILabel!
    @IBOutlet weak var itemUserMessagesUIImageView: UIImageView!
    @IBOutlet weak var messagesConditionUIButton: ConditionUIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
