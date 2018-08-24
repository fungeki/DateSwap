//
//  Rating.swift
//  DateSwap
//
//  Created by Ran Loock on 17/07/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

struct tallyRating: Decodable {
    var id: Int
    var stars: Int
}

func roundToHalves(_ number: Double)->Double{
    let divider = modf(number)
    var above = divider.0
    var below = divider.1
    if below <= 0.25{
        below = 0.0
    } else if below > 0.25 && below < 0.75 {
            below = 0.5
    } else {
        below = 0
        above += 1
    }
    let result = below + above
    //print("divider \(divider), above \(above), below \(below), result \(result)")
    return result
}

func updateUserRating(userid: Int){
    let urlRating = "http://dateswap.herokuapp.com/profilerating?receiverid=\(userid)"
    guard let urlObjRating = URL(string: urlRating) else {return}
    URLSession.shared.dataTask(with: urlObjRating) { (data, response, error) in
        DispatchQueue.main.async {
        var sum = 0
                        guard let data = data else {return}
                        do{
                            let mRatings = try JSONDecoder().decode([tallyRating].self, from: data)
                            for curr in mRatings{
                                sum += curr.stars
                            }
                            let ratingShow = Double(sum) / Double(mRatings.count)
                          //  print(ratingShow)
                            let ratingRounded = roundToHalves(ratingShow)
                            let urlUpdate = "http://dateswap.herokuapp.com/updateratingforprofile?id=\(userid)&rating=\(ratingRounded)"
                            
                            print(ratingRounded)
                            print(ratingShow)
                            guard let urlObjUpdate = URL(string: urlUpdate) else {return}
                            URLSession.shared.dataTask(with: urlObjUpdate, completionHandler: { (data, response, error) in
                                print("done")
                            }).resume()
                        }catch {
                            print(error)
                        }
            }
        
    }.resume()
    
}

struct reviewSQL{
    var id: Int
    var stars: Int
    var text: String
    var productid: Int
    var authorid: Int
    var userid: Int
    var time: String
}

struct Review{
    var ID: String
    var stars: Int
    var text: String
    var productID: String
    var userID: String
    var time: String
}

let rev1 = Review(ID: "1", stars: 1, text: "wow, so bad. \nFar away from home, looking out at the stars\nWe found a dead giraffe, floating right by Mars\nA strange creature he was with his big sad eyes\nHow'd he wind up here? What a long-necked surprise!\nWe carried him in, we sang a somber song", productID: "1", userID: "1", time: "")
let rev2 = Review(ID: "2", stars: 4, text: "wow, so good", productID: "1", userID: "2", time: "")
let rev3 = Review(ID: "3", stars: 5, text: "Just a roll, just a roll Just a roll on your drum Just a just a roll And the war has begun", productID: "1", userID: "3", time: "")
let rev4 = Review(ID: "4", stars: 3, text: "meow?", productID: "1", userID: "4", time: "")
let rev5 = Review(ID: "5", stars: 2, text: "woof!", productID: "1", userID: "1", time: "")
let reviews: [Review] = [rev1, rev2, rev3, rev4, rev5]
