//
//  ConditionUIButton.swift
//  DateSwap
//
//  Created by Ran Loock on 18/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ConditionUIButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable
    var cornerRadius: CGFloat = 10 {
        //property observer:
        didSet{
            //code that runs when the value is changed
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 10 {
        //property observer:
        didSet{
            //code that runs when the value is changed
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var bg: UIColor = UIColor.blue {
        //property observer:
        didSet{
            //code that runs when the value is changed
            backgroundColor = bg
        }
    }
    
    
    
    @IBInspectable
    var borderColor: UIColor = UIColor.cyan {
        //property observer:
        didSet{
            //code that runs when the value is changed
            
            //convert from UiColor => cgColor
            layer.borderColor = borderColor.cgColor //cgColor = UiColor
        }
    }
    
    
    @IBInspectable
    var padding: CGFloat = 8{
        didSet{
            let p = padding
            titleEdgeInsets = UIEdgeInsets(top: 0, left: p, bottom: 0, right: p)
        }
    }
    
    override var intrinsicContentSize: CGSize{
        let sz = super.intrinsicContentSize//super calc
        
        
        let newSize = CGSize(width: sz.width + padding * 6, height: sz.height + padding )
        
        return newSize
    }

}
