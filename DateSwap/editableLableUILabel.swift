//
//  EditableLableUILabel.swift
//  DateSwap
//
//  Created by Ran Loock on 25/08/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class EditableLableUILabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable
    var padding: CGFloat = 8
    
    @IBInspectable
    var additionToTopDown: CGFloat = 0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: padding + additionToTopDown, left: padding, bottom: padding + additionToTopDown, right: padding)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + padding * 2,
                      height: size.height + padding * 2 + additionToTopDown * 2)
    }
    

    
}

/*
 need a website
 build online presence
 viral video - frontal
 color the crowd
 google analytics
 bundle trading
 force new users to make a list with their garbage items
 bucket DB - by price
 if close to the asking price can exist on 2 bucket +- 10%
 0 - 50, 51-99, 100-299, 300 - 999, 1000- 4999, 5000+ - (???)
 key words - a must
 fake accounts
 ability to add money
 asking price - make the item search by MINIMAL price
 add a wish list
 analytics - know what to add and what to cut
 make EVENTS.
 
 only after proof of concept
 
 reporting system
 
 FEDEX
 */
/*
 app:
 Name:
 Spinner Force:
 
 5 domains:
 which it writes the pages
 www.spinnerforce.com/
 HTML:
 country, timezone, city.
 check users by their ip.
 counts the amount of people going in  - notifies the guy if his bundle is up
 
 FREE bundle :
 time limited
 entries limited
 
 PAYED:
 monthly
 
 notification : the user gets notification
 
 campigner side - marketer:
 777
 scratch card
 single coupon - with text
 roullette (wheel of fortune)
 
 will be able to set ONE ratio of "winners"
 first X people / once in X winners.
 first X people :
 
 -first version up to 3
 he could choose up to ANY levels
 
 marketer will choose the amounts of shares:
 marketer's designing:
 logo
 type of winning
 placeholder text of the share
 Bold becomes 2 stars *
 
 the marketer chooses a logo:
 link to the page:
 -------------------
 BOLD CAPTION
 link
 --------------------
 
 tutorials by videos
 
 the marketer can choose the background of the page
 
 shortens the link
 
 marketer report:
 can send to extra ppl
 metadescription
 
 NOTFICATIONS:
 share clicks
 
 MVP -
 3- options
 LOGO
 text:
 -Header
 -description
 -instructions
 Free: up to 300 users
 contact admins
 
 */
