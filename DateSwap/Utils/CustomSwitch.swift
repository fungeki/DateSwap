//
//  CustomSwitch.swift
//  DateSwap
//
//  Created by Dor tzemach on 15/10/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class CustomSwitch: UIControl {
    
    public var onTintColor = UIColor(red: 144/255, green: 202/255, blue: 119/255, alpha: 1)
    
    public var offTintColor = UIColor.lightGray
    
    public var cornerRadius: CGFloat = 0.5
    
    
    
    public var thumbTintColor = UIColor.white
    
    public var thumbCornerRadius: CGFloat = 0.5
    
    public var thumbSize = CGSize.zero
    
    
    
    public var padding: CGFloat = 1
    
    public var isOn = true
    
    public var animationDuration: Double = 0.5
    
    fileprivate var thumbView = UIView(frame: CGRect.zero)
    
    fileprivate var onPoint = CGPoint.zero
    
    fileprivate var offPoint = CGPoint.zero
    
    fileprivate var isAnimating = false
    
    private func clear() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    func setupUI() {
        self.clear()
        self.clipsToBounds = false
        self.thumbView.backgroundColor = self.thumbTintColor
        self.thumbView.isUserInteractionEnabled = false
        self.addSubview(self.thumbView)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        self.animate()
        return true
    }
    
 
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if !self.isAnimating {
            self.layer.cornerRadius = self.bounds.size.height * self.cornerRadius
            self.backgroundColor = self.isOn ? self.onTintColor : self.offTintColor
            
            
            // thumb managment
            
            let thumbSize = self.thumbSize != CGSize.zero ? self.thumbSize : CGSize(width:
                self.bounds.size.height - 2, height: self.bounds.height - 2)
            let yPostition = (self.bounds.size.height - thumbSize.height) / 2
            
            self.onPoint = CGPoint(x: self.bounds.size.width - thumbSize.width - self.padding, y: yPostition)
            self.offPoint = CGPoint(x: self.padding, y: yPostition)
            
            self.thumbView.frame = CGRect(origin: self.isOn ? self.onPoint : self.offPoint, size: thumbSize)
            
            self.thumbView.layer.cornerRadius = thumbSize.height * self.thumbCornerRadius
            
            self.thumbView.layer.shadowColor = UIColor.black.cgColor
            self.thumbView.layer.shadowRadius = 1.5
            self.thumbView.layer.shadowOpacity = 0.4
            self.thumbView.layer.shadowOffset = CGSize(width: 0.75, height: 2)
            
            
            
        }
        
    }
    
    private func animate() {
        self.isOn = !self.isOn
        self.isAnimating = true
        UIView.animate(withDuration: self.animationDuration, delay: 0, usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.5, options: [UIViewAnimationOptions.curveEaseOut,
                                                             UIViewAnimationOptions.beginFromCurrentState], animations: {
                                                                self.thumbView.frame.origin.x = self.isOn ? self.onPoint.x : self.offPoint.x
                                                                self.backgroundColor = self.isOn ? self.onTintColor : self.offTintColor
        }, completion: { _ in
            self.isAnimating = false
            self.sendActions(for: UIControlEvents.valueChanged)
        })
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
