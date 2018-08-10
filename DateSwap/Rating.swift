//
//  Rating.swift
//  DateSwap
//
//  Created by Ran Loock on 17/07/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

struct Review{
    var ID: String
    var stars: Int
    var text: String
    var productID: String
    var userID: String
    var time: Int
}

let rev1 = Review(ID: "1", stars: 1, text: "wow, so bad. \nFar away from home, looking out at the stars\nWe found a dead giraffe, floating right by Mars\nA strange creature he was with his big sad eyes\nHow'd he wind up here? What a long-necked surprise!\nWe carried him in, we sang a somber song", productID: "1", userID: "1", time: 1)
let rev2 = Review(ID: "2", stars: 4, text: "wow, so good", productID: "1", userID: "2", time: 1)
let rev3 = Review(ID: "3", stars: 5, text: "Just a roll, just a roll Just a roll on your drum Just a just a roll And the war has begun", productID: "1", userID: "3", time: 1)
let rev4 = Review(ID: "4", stars: 3, text: "meow?", productID: "1", userID: "4", time: 1)
let rev5 = Review(ID: "5", stars: 2, text: "woof!", productID: "1", userID: "1", time: 1)
let reviews: [Review] = [rev1, rev2, rev3, rev4, rev5]
