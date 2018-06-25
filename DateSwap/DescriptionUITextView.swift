//
//  DescriptionUITextView.swift
//  DateSwap
//
//  Created by Ran Loock on 25/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class DescriptionUITextView: UITextView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable
    var cornerRadius: CGFloat = 10{
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable
    var borderWidth: CGFloat = 10{
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable
    var borderColor: UIColor = UIColor.black{
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable
    var paddingCorners: CGFloat = 10{
        didSet{
            textContainer.lineFragmentPadding = paddingCorners
        }
    }
    @IBInspectable
    var paddingTop: CGFloat = 10{
        didSet{
            textContainerInset = UIEdgeInsets(top: paddingTop, left: paddingCorners, bottom: 0, right: paddingCorners)
        }
    }
    
}
