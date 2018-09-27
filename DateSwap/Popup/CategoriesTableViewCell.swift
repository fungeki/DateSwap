//
//  CategoriesTableViewCell.swift
//  DateSwap
//
//  Created by Ran Loock on 27/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryImageUIImage: UIImageView!
    @IBOutlet weak var categoryNameUILabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func layoutSubviews() {
        categoryImageUIImage.layer.cornerRadius = categoryImageUIImage.frame.size.height / 2
    }
}
