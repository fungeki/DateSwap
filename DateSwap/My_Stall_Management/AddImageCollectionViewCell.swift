//
//  AddImageCollectionViewCell.swift
//  DateSwap
//
//  Created by Ran Loock on 04/10/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class AddImageCollectionViewCell: UICollectionViewCell {
    
    
    var isFull = false
    @IBOutlet weak var itemImageUIImage: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        itemImageUIImage.addJeansEffect(color: grayFour(), cornerRadius: 20, lineWidth: 5, lineDashPattern: [9,9])
    }
}
