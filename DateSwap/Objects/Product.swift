//
//  Product.swift
//  DateSwap
//
//  Created by Ran Loock on 14/06/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

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
    var category: Int
    var delivered: Int
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
    let mCategory = Category.init(id: product.category)
    let mPrice = String(product.price)
    let mDeliveredStatus = DeliveredStatus.init(id: product.delivered) ?? DeliveredStatus.deleted
    return Product(ID: product.id, title: product.title, userID: product.userid, image: product.image, description: product.description, lastUpdate: date, area: product.area, condition: mCondition!, price: mPrice, category: mCategory!, status: mDeliveredStatus)
}

func arrayProductsSQL2LocalForOnlineUser(array: [ProductExpSQL])->[Product]{
    var mProducts = [Product]()
    var i = 0
    for pro in array{
        mProducts.append(productSQL2Local(product: pro))
        i += 1
    }
    return mProducts
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
    var category: Category
    var status: DeliveredStatus
    
}

enum ProductCondition: Int{
    case New = 0
    case Used = 1
    case Refurbished = 2
    case LikeNew = 3
    case Damaged = 4
    
    func returnImage() -> UIImage{
        switch self.rawValue{
        case 0:
            return #imageLiteral(resourceName: "ic_symbal_new")
        case 1:
            return #imageLiteral(resourceName: "ic_symbal_used")
        case 2:
            return #imageLiteral(resourceName: "ic_cymbal_renewed")
        case 3:
            return #imageLiteral(resourceName: "ic_symbal_like_new")
        default:
            return #imageLiteral(resourceName: "ic_symbal_damaged")
        }
    }
    
}

enum DeliveredStatus: String{
    case active = "Active"
    case hold = "Hold"
    case pending = "Pending"
    case delivered = "Delivered"
    case revision = "Under Revision"
    case deleted = ""
    
    static let allValues = [active, hold, pending, delivered, revision]
    static let selectableValues = [active, hold]
    
    init?(id: Int){
        switch id {
        case 0:
            self = .active
            break
        case 1:
            self = .hold
            break
        case 2:
            self = .pending
            break
        case 3:
            self = .delivered
            break
        case 4:
            self = .revision
            break
        default:
            self = .deleted
        }
    }
    
}

enum Category: String{
    case toys = "Toys & Babies"
    case books = "Books & Entertainment"
    case garage = "Garage Sale & Misc"
    case hobbies = "Hobbies & Collectibles"
    case clothing = "Clothing & Accessories"
    case family = "Family & Pets"
    case home = "Home & Garden"
    case wishlist = "Wish List"
    case misc = "misc"
    
    static let allValues = [toys, books, garage, hobbies, clothing, family, home]
    
    init?(id : Int) {
        switch id {
        case 1:
            self = .garage
            break
        case 2:
            self = .toys
            break
        case 3:
            self = .books
            break
        case 4:
            self = .hobbies
            break
        case 5:
            self = .clothing
            break
        case 6:
            self = .family
            break
        case 7:
            self = .home
            break
        case 10:
            self = .wishlist
            break
        default:
            self = .misc
        }
    }
    func returnCategoryNum()->Int{
        switch self{
        case .garage:
            return 1
        case .toys:
            return 2
        case .books:
            return 3
        case .hobbies:
            return 4
        case .family:
            return 6
        case .home:
            return 7
        case .clothing:
            return 5
        case .misc:
            return -1
        default:
            return 10
        }
    }

}
func returnCategoryArray()->[String]{
    var mCategories = [String]()
    for category in Category.allValues {
        mCategories.append(category.rawValue)
    }
    return mCategories
}

func returnCondition(_ condition: ProductCondition)->String{
    switch condition{
    case .New:
       return "New"
    case .LikeNew:
        return "Like New"
    case .Refurbished:
        return "Refurbished"
    case .Damaged:
        return "Damaged"
    case .Used:
        return "Used"
    }
}
func returnConditionArray()->[String]{
    return ["New", "Like New", "Refurbished", "Used", "Damaged"]
}




let p1 = Product(ID: 1, title: "Cat sebastian robinzon shokoi hashlishi", userID: 2, image: "https://i.imgflip.com/q633e.jpg", description: "A meow (American English) or miaow (British English; /miˈaʊ/),[1] is a vocalization of cats. They have diverse tones and are sometimes chattered, murmured or whispered. Adult cats rarely meow to each other, so an adult cat meowing to human beings is probably a post-domestication extension of meowing by kittens, a call for attention.", lastUpdate: "02/01/2001", area: "far", condition: .Damaged, price: "500", category: .books, status: DeliveredStatus.active)
let p2 = Product(ID: 2, title: "Plane", userID: 2, image: "https://media.defense.gov/2005/Dec/22/2000574703/780/780/0/050308-F-1234P-011.JPG", description: "wooooooooshes in the sky", lastUpdate: "02/05/2003", area: "sky", condition: .Refurbished, price: "1942", category: .books, status: DeliveredStatus.active)
let p3 = Product(ID: 3, title: "China", userID: 2, image: "https://cdn4.iconfinder.com/data/icons/china-travel/512/as_288-512.png", description: "a country", lastUpdate: "14/06/2018", area: "asia", condition: .Used, price: "1403500365", category: .books, status: DeliveredStatus.active)
let p4 = Product(ID: 4, title: "Demogorgon", userID: 2, image: "https://vignette.wikia.nocookie.net/nuntonlibrary/images/8/8a/Demogorgon.jpg", description: "The Demogorgon, also known as the Monster, was a predatory humanoid creature that entered Hawkins, Indiana in November 1983. The creature originated from the parallel dimension known as the Upside Down. When Eleven, a psychic test subject from Hawkins National Laboratory, made interdimensional contact with it, a gate between dimensions opened at the lab.", lastUpdate: "", area: "", condition: .LikeNew, price: "666", category: .books, status: DeliveredStatus.active)
let p5 = Product(ID: 5, title: "Nachom Takom",userID: 2, image: "https://upload.wikimedia.org/wikipedia/commons/2/24/Stehaufmann.jpg", description: "A roly-poly toy, round-bottomed doll, tilting doll, tumbler or wobbly man is a round-bottomed toy,", lastUpdate: "", area: "", condition: .New, price: "free", category: .books, status: DeliveredStatus.active)

var products:[Product] = [p1 , p2 , p3, p4, p5]


let noActiveProduct = Product(ID: 0, title: "Please Select a product to barter", userID: 0, image: "https://firebasestorage.googleapis.com/v0/b/dateswap-635d7.appspot.com/o/card_empty_dark.png?alt=media", description: "", lastUpdate: "", area: "", condition: .New, price: "0", category: .misc, status: DeliveredStatus.active)
let noProductToSwipe = Product(ID: 0, title: "No more items", userID: 0, image: "https://firebasestorage.googleapis.com/v0/b/dateswap-635d7.appspot.com/o/card_empty_dark.png?alt=media", description: "", lastUpdate: "", area: "", condition: .New, price: "0", category: .misc, status: DeliveredStatus.active)
let emptyWishlist = Product(ID: 0, title: "Emppty Wish List", userID: 0, image: "https://firebasestorage.googleapis.com/v0/b/dateswap-635d7.appspot.com/o/card_empty_dark.png?alt=media", description: "", lastUpdate: "", area: "", condition: .New, price: "0", category: .misc, status: DeliveredStatus.active)
