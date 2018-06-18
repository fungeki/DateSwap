//
//  Product.swift
//  DateSwap
//
//  Created by Ran Loock on 14/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation
struct Product{
    var title: String
    var image: String
    var description: String
    var lastUpdate: String
    var area: String
}

let p1 = Product(title: "Cat", image: "https://i.imgflip.com/q633e.jpg", description: "A meow (American English) or miaow (British English; /miˈaʊ/),[1] is a vocalization of cats. They have diverse tones and are sometimes chattered, murmured or whispered. Adult cats rarely meow to each other, so an adult cat meowing to human beings is probably a post-domestication extension of meowing by kittens, a call for attention.", lastUpdate: "02/01/2001", area: "far")
let p2 = Product(title: "Plane", image: "https://media.defense.gov/2005/Dec/22/2000574703/780/780/0/050308-F-1234P-011.JPG", description: "wooooooooshes in the sky", lastUpdate: "02/05/2003", area: "sky")
let p3 = Product(title: "China", image: "https://cdn4.iconfinder.com/data/icons/china-travel/512/as_288-512.png", description: "a country", lastUpdate: "14/06/2018", area: "asia")
let p4 = Product(title: "Demogorgon", image: "https://vignette.wikia.nocookie.net/nuntonlibrary/images/8/8a/Demogorgon.jpg", description: "The Demogorgon, also known as the Monster, was a predatory humanoid creature that entered Hawkins, Indiana in November 1983. The creature originated from the parallel dimension known as the Upside Down. When Eleven, a psychic test subject from Hawkins National Laboratory, made interdimensional contact with it, a gate between dimensions opened at the lab.", lastUpdate: "", area: "")

var products:[Product] = [p1 , p2 , p3, p4]
