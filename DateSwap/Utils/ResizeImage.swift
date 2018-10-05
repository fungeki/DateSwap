//
//  ResizeImage.swift
//  DateSwap
//
//  Created by Ran Loock on 14/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation
import UIKit
func resizeImage(_ image: UIImage) -> UIImage {
    var actualHeight = Float(image.size.height)
    var actualWidth = Float(image.size.width)
    let maxHeight: Float = 400.0
    let maxWidth: Float = 400.0
    var imgRatio: Float = actualWidth / actualHeight
    let maxRatio: Float = maxWidth / maxHeight
    let compressionQuality: Float = 0.7
    //50 percent compression
    if actualHeight > maxHeight || actualWidth > maxWidth {
        if imgRatio < maxRatio {
            //adjust width according to maxHeight
            imgRatio = maxHeight / actualHeight
            actualWidth = imgRatio * actualWidth
            actualHeight = maxHeight
        }
        else if imgRatio > maxRatio {
            //adjust height according to maxWidth
            imgRatio = maxWidth / actualWidth
            actualHeight = imgRatio * actualHeight
            actualWidth = maxWidth
        }
        else {
            actualHeight = maxHeight
            actualWidth = maxWidth
        }
    }
    let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(actualWidth), height: CGFloat(actualHeight))
    UIGraphicsBeginImageContext(rect.size)
    image.draw(in: rect)
    let img = UIGraphicsGetImageFromCurrentImageContext()
    let imageData = UIImageJPEGRepresentation(img!, CGFloat(compressionQuality))
    UIGraphicsEndImageContext()
    return UIImage(data: imageData!) ?? UIImage()
}
