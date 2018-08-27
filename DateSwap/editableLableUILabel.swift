//
//  EditableLableUILabel.swift
//  DateSwap
//
//  Created by Ran Loock on 25/08/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class EditableLableUILabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable
    var padding: CGFloat = 8
    
    @IBInspectable
    var additionToTopDown: CGFloat = 0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: padding + additionToTopDown, left: padding, bottom: padding + additionToTopDown, right: padding)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + padding * 2,
                      height: size.height + padding * 2 + additionToTopDown * 2)
    }
    

    
}
