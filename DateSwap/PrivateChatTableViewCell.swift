//
//  PrivateChatTableViewCell.swift
//  DateSwap
//
//  Created by Dor tzemach on 31/08/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class PrivateChatTableViewCell: UITableViewCell {

    @IBOutlet weak var rightSenderMessagePrivateChatEditableLableUILable: EditableLableUILabel!
    @IBOutlet weak var profileLeftSenderConditionUIButton: ConditionUIButton!
    @IBOutlet weak var leftSenderMessagePrivateChatEditableLableUILable: EditableLableUILabel!
    var isItMe: Bool?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        guard let itIsMe = isItMe else {
            print("nobody speaks damnit")
            return
        }
        if itIsMe {
        rightSenderMessagePrivateChatEditableLableUILable.roundCorners(corners: [.topLeft, .topRight, .bottomLeft], radius: 20)
        } else {
            leftSenderMessagePrivateChatEditableLableUILable.roundCorners(corners: [.topLeft, .topRight, .bottomRight], radius: 20)
        }

    }
}
