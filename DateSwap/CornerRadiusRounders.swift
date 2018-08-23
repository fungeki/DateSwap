//
//  CornerRadiusRounders.swift
//  DateSwap
//
//  Created by Ran Loock on 20/08/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class CornerRadiusRounders: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    //corner radius on - top, and bottom right
    func roundMyChatCorners(radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topRight, .topLeft, .bottomRight], cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    //corner radius on - top, and bottom Left
    func roundOtherChatCorners(radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topRight, .topLeft, .bottomLeft], cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    //corner radius on UIRectCorner Arrays - [corners]
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
