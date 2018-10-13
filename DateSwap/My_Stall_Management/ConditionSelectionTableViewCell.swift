//
//  ConditionSelectionTableViewCell.swift
//  DateSwap
//
//  Created by Ran Loock on 23/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ConditionSelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var symbalConditionUIImageView: UIImageView!
    @IBOutlet weak var conditionNameUIButton: ConditionUIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
