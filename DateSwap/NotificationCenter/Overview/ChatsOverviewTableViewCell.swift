//
//  ChatsOverviewTableViewCell.swift
//  DateSwap
//
//  Created by Ran Loock on 08/10/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ChatsOverviewTableViewCell: UITableViewCell {

    @IBOutlet weak var lastMessageUILabel: UILabel!
    @IBOutlet weak var hisItemNameUILabel: UILabel!
    @IBOutlet weak var hisImageUIimage: UIImageView!
    @IBOutlet weak var myItemUIImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
