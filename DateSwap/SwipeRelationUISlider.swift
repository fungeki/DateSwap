//
//  SwipeRelationUISlider.swift
//  DateSwap
//
//  Created by Ran Loock on 29/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class SwipeRelationUISlider: UISlider {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable
    var trackHeightReverse: CGFloat = 4
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var newBounds = super.trackRect(forBounds: bounds)
        newBounds.size.height = newBounds.size.height - trackHeightReverse
        return newBounds
    }
    
    
}
