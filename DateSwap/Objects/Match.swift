//
//  Match.swift
//  DateSwap
//
//  Created by Ran Loock on 03/10/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

struct Match: Decodable {
    var id: Int
    var user_1: Int
    var user_2: Int
    var prodid_1: Int
    var prodid_2: Int
    var status: Int
}
