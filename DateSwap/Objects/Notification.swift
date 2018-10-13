//
//  Notification.swift
//  DateSwap
//
//  Created by Ran Loock on 11/10/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation


struct Notification: Decodable {
    var id: Int
    var image: String
    var offers: [Like]
}
