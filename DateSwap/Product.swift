//
//  Product.swift
//  DateSwap
//
//  Created by Ran Loock on 14/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

struct ProductExpSQL{
    var ID: Int
    var userID: Int
    var title: String
    var image: String
    var description: String
    var lastUpdate: Int
    var area: String
    var condition: Int
    var price: String
}
func productExpToUsable(product: ProductExpSQL)->Product{
    let lastUpdate = TimeInterval(product.lastUpdate)
    let time = NSDate(timeIntervalSince1970: TimeInterval(lastUpdate)) as Date
    let formatter = DateFormatter();
    formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
    let formatString = formatter.string(from: time)
    let prodCondition = ProductCondition(rawValue: product.condition)
    return Product(title: product.title, userID: product.userID, image: product.image, description: product.description, lastUpdate: formatString, area: product.area, condition: prodCondition!, price: product.price)
}
struct Product{
    var title: String
    var userID: Int
    var image: String
    var description: String
    var lastUpdate: String
    var area: String
    var condition: ProductCondition
    var price: String
    
    
}

enum ProductCondition: Int{
    case New = 0
    case Used = 1
    case Renewed = 2
    case LikeNew = 3
    case Damaged = 4
}

func returnCondition(_ condition: ProductCondition)->String{
    switch condition{
    case .New:
       return "New"
    case .LikeNew:
        return "Like New"
    case .Renewed:
        return "Renewed"
    case .Damaged:
        return "Damaged"
    case .Used:
        return "Used"
    }
}
func returnConditionArray()->[String]{
    return ["New", "Like New", "Renewed", "Damaged", "Used"]
}


let p1 = Product(title: "Cat", userID: 2, image: "https://i.imgflip.com/q633e.jpg", description: "A meow (American English) or miaow (British English; /miˈaʊ/),[1] is a vocalization of cats. They have diverse tones and are sometimes chattered, murmured or whispered. Adult cats rarely meow to each other, so an adult cat meowing to human beings is probably a post-domestication extension of meowing by kittens, a call for attention.", lastUpdate: "02/01/2001", area: "far", condition: .Damaged, price: "500")
let p2 = Product(title: "Plane", userID: 2, image: "https://media.defense.gov/2005/Dec/22/2000574703/780/780/0/050308-F-1234P-011.JPG", description: "wooooooooshes in the sky", lastUpdate: "02/05/2003", area: "sky", condition: .Renewed, price: "1942")
let p3 = Product(title: "China", userID: 2, image: "https://cdn4.iconfinder.com/data/icons/china-travel/512/as_288-512.png", description: "a country", lastUpdate: "14/06/2018", area: "asia", condition: .Used, price: "1403500365")
let p4 = Product(title: "Demogorgon", userID: 2, image: "https://vignette.wikia.nocookie.net/nuntonlibrary/images/8/8a/Demogorgon.jpg", description: "The Demogorgon, also known as the Monster, was a predatory humanoid creature that entered Hawkins, Indiana in November 1983. The creature originated from the parallel dimension known as the Upside Down. When Eleven, a psychic test subject from Hawkins National Laboratory, made interdimensional contact with it, a gate between dimensions opened at the lab.", lastUpdate: "", area: "", condition: .LikeNew, price: "666")
let p5 = Product(title: "Nachom Takom",userID: 2, image: "https://upload.wikimedia.org/wikipedia/commons/2/24/Stehaufmann.jpg", description: "A roly-poly toy, round-bottomed doll, tilting doll, tumbler or wobbly man is a round-bottomed toy,", lastUpdate: "", area: "", condition: .New, price: "free")

var products:[Product] = [p1 , p2 , p3, p4, p5]
