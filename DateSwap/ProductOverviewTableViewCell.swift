//
//  ProductOverviewTableViewCell.swift
//  DateSwap
//
//  Created by Ran Loock on 19/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ProductOverviewTableViewCell: UITableViewCell {

    @IBOutlet weak var priceUIButton: UIButton!
    @IBOutlet weak var conditionUIButton: ConditionUIButton!
    var product: Product!
    @IBOutlet weak var productUIImageView: UIImageView!
    @IBOutlet weak var titleUILabel: UILabel!
    @IBOutlet weak var descriptionUILabel: UILabel!
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
        self.contentView.layoutSubviews()
        priceUIButton.addJeansEffect(UIColor.black.cgColor)
    }

}
