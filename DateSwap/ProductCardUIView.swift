//
//  ProductCardUIView.swift
//  DateSwap
//
//  Created by Ran Loock on 28/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ProductCardUIView: UIView {

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
    var shadowColor: UIColor = UIColor.black{
        didSet{
            layer.shadowColor = shadowColor.cgColor
        }
    }
    @IBInspectable
    var shadowOpacity: Float = 0.8{
        didSet{
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat = 10{
        didSet{
            layer.cornerRadius = cornerRadius
            layer.shadowRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var shadowOffset: CGFloat = 10{
        didSet{
            layer.shadowOffset = CGSize(width: shadowOffset, height: shadowOffset)
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
