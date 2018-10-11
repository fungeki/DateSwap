//
//  Notification.swift
//  DateSwap
//
//  Created by Ran Loock on 11/10/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation


struct Offer: Decodable{
    var id: Int
    var userid: Int
    var myproductid: Int
    var hisproductid: Int
    var status: Int
}


struct Notification: Decodable {
    var id: Int
    var offers: [Offer]
}
