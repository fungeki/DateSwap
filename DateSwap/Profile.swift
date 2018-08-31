//
//  Profile.swift
//  DateSwap
//
//  Created by Ran Loock on 03/07/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation
import GoogleSignIn
import FirebaseAuth

var currentUser: User?

struct User{
    var profile: Profile
    var googleNick: String
}

struct ProfileSQL: Decodable {
    var id: Int
    var nickname: String
    var pic: String
    var rating: Float
    var email: String
}

func uploadProfileFromFirebase(){
    guard let user = Auth.auth().currentUser else {return}
    let nickname = user.displayName ?? ""
    guard let defPic = URL(string: "https://i.imgur.com/puqnoGd.png") else {
        print("pic error")
        return
    }
    let picObj = user.photoURL ?? defPic
    let pic = try! String(contentsOf: picObj)
    let email = user.email ?? ""
    
    let urlString = "http://dateswap.herokuapp.com/addprofile?nickname=\(nickname)&pic=\(pic)&email=\(email)"
}

func profileSQL2internal(profileSQL: ProfileSQL) -> Profile{
    return Profile(ID: profileSQL.id, nickname: profileSQL.nickname, pic: profileSQL.pic, rating: Double(profileSQL.rating), email: profileSQL.email)
}

struct Profile {
    var ID: Int
    var nickname: String
    var pic: String
    var rating: Double
    var email: String
}

let u1 = Profile(ID: 1, nickname: "Jiff the Giraffe", pic: "https://cdn.iwastesomuchtime.com/11292012211233.jpg", rating: 1, email: "")
let u2 = Profile(ID: 2, nickname: "Silly McSeal", pic: "https://media.tenor.com/images/e5b6345e033bb8d3918f31aea81101cc/tenor.png", rating: 4.5, email: "")
let u3 = Profile(ID: 3, nickname: "Afro Sloth", pic: "https://img.clipartxtras.com/12a60f9fed276debec3b909f83f23074_nope-funny-derpy-sloth-drawing_600-450.jpeg", rating: 3, email: "")
let u4 = Profile(ID: 4, nickname: "Afro", pic: "https://img.clipartxtras.com/12a60f9fed276debec3b909f83f23074_nope-funny-derpy-sloth-drawing_600-450.jpeg", rating: 3, email: "")
let u5 = Profile(ID: 5, nickname: "Ouchstriche", pic: "https://aminus3.s3.amazonaws.com/image/g0005/u00004960/i00214121/6d2f4fce2d8dea77054a68c4fdab906f_large.jpg", rating: 4.5, email: "")
let u6 = Profile(ID: 5, nickname: "Mr Empty", pic: "https://i.imgur.com/puqnoGd.png", rating: 4.5, email: "")
var profiles: [Profile] = [u1, u2, u3, u5, u6]
