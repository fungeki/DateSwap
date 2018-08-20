//
//  JeansEffect.swift
//  DateSwap
//
//  Created by Ran Loock on 18/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

extension UIView {
    func addJeansEffect(_ color: CGColor) {
        
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineDashPattern = [6,3]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath
        
        self.layer.addSublayer(shapeLayer)
    }
    
    //custom jeans
    func addJeansEffect(color: CGColor, cornerRadius: CGFloat, lineWidth: CGFloat, lineDashPattern: [NSNumber]) {
        
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineDashPattern = lineDashPattern
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: cornerRadius).cgPath
        self.layer.addSublayer(shapeLayer)
    }
    func addJeansEffect(color: CGColor, cornerRadius: CGFloat, lineWidth: CGFloat, lineDashPattern: [NSNumber], distanceTop: CGFloat, distanceSides: CGFloat) {
        
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width - distanceSides * 2, height: frameSize.height - distanceTop * 2)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width / 2, y: frameSize.height / 2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineDashPattern = lineDashPattern
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: cornerRadius).cgPath
        self.layer.addSublayer(shapeLayer)
    }
    //position the Jeans
    func addJeansEffect(color: CGColor, cornerRadius: CGFloat, lineWidth: CGFloat, lineDashPattern: [NSNumber], position: CGPoint) {
        
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = position
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineDashPattern = lineDashPattern
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: cornerRadius).cgPath
        self.layer.addSublayer(shapeLayer)
    }
    
    func changeRectHeight(forHeight: CGFloat){
        let frameSize = self.frame.size
        let newHeight = forHeight/1.81
        self.frame = CGRect(x: 0, y: 0, width: frameSize.width, height: newHeight)
    }
    
    func roundMyChatCorners(radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topRight, .topLeft, .bottomRight], cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    func roundOtherChatCorners(radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topRight, .topLeft, .bottomLeft], cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}
