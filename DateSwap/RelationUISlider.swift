//
//  RelationUISlider.swift
//  DateSwap
//
//  Created by Ran Loock on 29/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class RelationUISlider: UISlider {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable
    var trackHeight: CGFloat = 8
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var newBounds = super.trackRect(forBounds: bounds)
        newBounds.size.height = trackHeight * 2
        return newBounds
    }
    
//    override func minimumValueImageRect(forBounds bounds: CGRect) -> CGRect {
//        return CGRect(x: 0, y: super.frame.height / 2, width: trackHeight * 2, height: trackHeight * 2)
//    }
    
//    override func minimumTrackImage(for state: UIControlState) -> UIImage? {
//        var image = UIImage(named: "ic_x_grey")
//        //image?.size = CGSize(width: trackHeight, height: trackHeight)
//        image?.draw(in: CGRect(x: 0, y: 0, width: trackHeight, height: trackHeight))
//        return image
//    }
//    override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
//        var newBounds = super.thumbRect(forBounds: bounds, trackRect: rect, value: value)
//        newBounds.size.height = 2
//
//       // newBounds.size.width = bounds.width * 0.9
//        newBounds.origin.y = newBounds.origin.y
//        return newBounds
//    }
//    override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
//        var newSize = CGRect(x: rect.width / 2, y:  rect.height *  3, width: rect.width, height: rect.height)
//        return newSize
//    }
}

func imageResizeForSlider(_ myImage: UIImage)-> UIImage{
    let resizedImage = myImage.resize(size: CGSize(width: 48, height: 48))
    return resizedImage
}
