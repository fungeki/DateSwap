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

//let m1 =  Message(msgID: "1", senderID: "2", receiverID: "2", text: "meow", time: 10000, productID: "2")
//let m2 = Message(msgID: "2", senderID: "2", receiverID: "1", text: "woof", time: 11000000, productID: "2")
//let m3 = Message(msgID: "3", senderID: "1", receiverID: "2", text: "meow is the meow and my meow if meow so meow\nthis is the only meow in this world", time: 11100000, productID: "2")
//let m4 = Message(msgID: "4", senderID: "3", receiverID: "2", text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", time: 123857, productID: "2")

let m1 = Message(msgID: "1", senderID: "5", receiverID: "1", text: "Hi, Like your little bracelet", time: 2132177, productID: "2")
let m2 = Message(msgID: "2", senderID: "1", receiverID: "5", text: "Thanks!", time: 2132177, productID: "3")
let m3 = Message(msgID: "3", senderID: "1", receiverID: "5", text: "your pink elephant is a fragile product", time: 2132177, productID: "3")
let m4 = Message(msgID: "4", senderID: "1", receiverID: "5", text: "?", time: 2132177, productID: "3")
let m5 = Message(msgID: "5", senderID: "5", receiverID: "1", text: "No, you can throw him a second floor and he'll be okay lol", time: 2132177, productID: "2")
let m6 = Message(msgID: "6", senderID: "1", receiverID: "5", text: "really????! Well then I owe it now", time: 2132177, productID: "3")
let m7 = Message(msgID: "7", senderID: "5", receiverID: "1", text: "I can meet in half an hour from now if you're interested", time: 2132177, productID: "2")
let m8 = Message(msgID: "8", senderID: "1", receiverID: "5", text: "Ok let's do it! from Tel Aviv?", time: 2132177, productID: "3")
let m9 = Message(msgID: "9", senderID: "1", receiverID: "5", text: ":)))", time: 2132177, productID: "3")



let messages: [Message] = [m1,m2,m3,m4,m5,m6,m7,m8,m9]
