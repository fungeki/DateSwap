//
//  Messages.swift
//  DateSwap
//
//  Created by Ran Loock on 17/07/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

struct Message{
    var msgID: String
    var senderID: String
    var receiverID: String
    var text: String
    var time: Int
    var productID: String
}

let m1 = Message(msgID: "1", senderID: "1", receiverID: "2", text: "meow?", time: 1000000, productID: "2")
let m2 = Message(msgID: "2", senderID: "2", receiverID: "1", text: "woof", time: 11000000, productID: "2")
let m3 = Message(msgID: "3", senderID: "1", receiverID: "2", text: "meow is the meow and my meow if meow so meow\nthis is the only meow in this world", time: 11100000, productID: "2")


let messages: [Message] = [m1, m2, m3]
