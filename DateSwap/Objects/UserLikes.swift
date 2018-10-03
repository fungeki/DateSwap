//
//  UserLikes.swift
//  DateSwap
//
//  Created by Ran Loock on 17/07/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

struct Like: Decodable {
    var id: Int
    var myproductid: Int
    var hisproductid: Int
    var status: Int
}
