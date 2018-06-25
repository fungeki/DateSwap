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
    @IBInspectable
    var placeHolderText: String = ""{
        didSet{
            text = placeHolderText
            textColor = UIColor.lightGray
        }
    }
//    func textViewDidBeginEditing(_ textView: UITextView)
//    {
//        if (textView.text == placeHolderText)
//        {
//            textView.text = ""
//            textView.textColor = .black
//        }
//        textView.becomeFirstResponder() //Optional
//    }
//    
//    func textViewDidEndEditing(_ textView: UITextView)
//    {
//        if (textView.text == "")
//        {
//            textView.text = placeHolderText
//            textView.textColor = .lightGray
//        }
//        textView.resignFirstResponder()
//    }
}
