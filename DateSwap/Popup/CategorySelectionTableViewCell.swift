//
//  CategorySelectionTableViewCell.swift
//  DateSwap
//
//  Created by Ran Loock on 26/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class CategorySelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryUILabel: UILabel!
    @IBOutlet weak var categoryImageUIImage: UIImageView!
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
        categoryImageUIImage.layer.cornerRadius = categoryImageUIImage.frame.size.height / 2
    }

}
