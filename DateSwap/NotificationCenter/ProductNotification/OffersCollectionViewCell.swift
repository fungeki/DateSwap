//
//  OffersCollectionViewCell.swift
//  DateSwap
//
//  Created by Ran Loock on 14/10/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class OffersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var offerCollectionUIImage: UIImageView!
    
    
    @IBOutlet weak var productTitleUILabel: UILabel!
    @IBOutlet weak var priceUIlabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func layoutSubviews() {
        offerCollectionUIImage.layer.cornerRadius = priceUIlabel.layer.frame.height / 2.0
        priceUIlabel.layer.cornerRadius = priceUIlabel.layer.frame.height / 2.0
    }
}
