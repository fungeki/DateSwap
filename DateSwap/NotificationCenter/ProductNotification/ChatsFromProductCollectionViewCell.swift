//
//  ChatsFromProductCollectionViewCell.swift
//  DateSwap
//
//  Created by Ran Loock on 21/10/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ChatsFromProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var itemTitleUILabel: UILabel!
    @IBOutlet weak var unreadAmountUILabel: EditableLableUILabel!
    
    @IBOutlet weak var priceUILabel: EditableLableUILabel!
    
    @IBOutlet weak var itemImageUIImageView: UIImageView!
    
    override func layoutSubviews() {
        priceUILabel.layer.cornerRadius = priceUILabel.layer.frame.height / 2
        itemImageUIImageView.layer.cornerRadius = 20
       priceUILabel.layer.cornerRadius = priceUILabel.layer.frame.height / 2
        
    }
}
