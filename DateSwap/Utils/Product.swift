//
//  Product.swift
//  DateSwap
//
//  Created by Ran Loock on 14/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

struct ProductExpSQL: Decodable{
    var id: Int
    var userid: Int
    var title: String
    var image: String
    var description: String
    var lastupdate: String
    var area: String
    var condition: Int
    var price: Int
}
func productSQL2Local(product: ProductExpSQL)->Product{
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    let sqlDate = product.lastupdate
    var date = ""
    if let mDate = dateFormatter.date(from: sqlDate) {
        dateFormatter.dateFormat = "E, MMM d, HH:mm"
        let temp = dateFormatter.string(from: mDate)

        date = temp
    }
    let mCondition = ProductCondition(rawValue: product.condition)
    let mPrice = String(product.price)
    return Product(ID: product.id, title: product.title, userID: product.userid, image: product.image, description: product.description, lastUpdate: date, area: product.area, condition: mCondition!, price: mPrice)
}

func arrayProductsSQL2Local(array: [ProductExpSQL])->[Product]{
    var mProducts = [Product]()
    for pro in array{
        mProducts.append(productSQL2Local(product: pro))
    }
    return mProducts
}
struct Product{
    var ID: Int
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


let p1 = Product(ID: 1, title: "Cat sebastian robinzon shokoi hashlishi", userID: 2, image: "https://i.imgflip.com/q633e.jpg", description: "A meow (American English) or miaow (British English; /miˈaʊ/),[1] is a vocalization of cats. They have diverse tones and are sometimes chattered, murmured or whispered. Adult cats rarely meow to each other, so an adult cat meowing to human beings is probably a post-domestication extension of meowing by kittens, a call for attention.", lastUpdate: "02/01/2001", area: "far", condition: .Damaged, price: "500")
let p2 = Product(ID: 2, title: "Plane", userID: 2, image: "https://media.defense.gov/2005/Dec/22/2000574703/780/780/0/050308-F-1234P-011.JPG", description: "wooooooooshes in the sky", lastUpdate: "02/05/2003", area: "sky", condition: .Renewed, price: "1942")
let p3 = Product(ID: 3, title: "China", userID: 2, image: "https://cdn4.iconfinder.com/data/icons/china-travel/512/as_288-512.png", description: "a country", lastUpdate: "14/06/2018", area: "asia", condition: .Used, price: "1403500365")
let p4 = Product(ID: 4, title: "Demogorgon", userID: 2, image: "https://vignette.wikia.nocookie.net/nuntonlibrary/images/8/8a/Demogorgon.jpg", description: "The Demogorgon, also known as the Monster, was a predatory humanoid creature that entered Hawkins, Indiana in November 1983. The creature originated from the parallel dimension known as the Upside Down. When Eleven, a psychic test subject from Hawkins National Laboratory, made interdimensional contact with it, a gate between dimensions opened at the lab.", lastUpdate: "", area: "", condition: .LikeNew, price: "666")
let p5 = Product(ID: 5, title: "Nachom Takom",userID: 2, image: "https://upload.wikimedia.org/wikipedia/commons/2/24/Stehaufmann.jpg", description: "A roly-poly toy, round-bottomed doll, tilting doll, tumbler or wobbly man is a round-bottomed toy,", lastUpdate: "", area: "", condition: .New, price: "free")

var products:[Product] = [p1 , p2 , p3, p4, p5]