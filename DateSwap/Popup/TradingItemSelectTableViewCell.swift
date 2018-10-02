//
//  TradingItemSelectTableViewCell.swift
//  DateSwap
//
//  Created by Ran Loock on 22/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class TradingItemSelectTableViewCell: UITableViewCell {

    var product: Product!
    @IBOutlet weak var priceUIButton: UIButton!
    @IBOutlet weak var descriptionUILabel: UILabel!
    @IBOutlet weak var productTitleUILabel: UILabel!
    @IBOutlet weak var itemUIImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
