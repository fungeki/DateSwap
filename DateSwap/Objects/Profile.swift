//
//  Profile.swift
//  DateSwap
//
//  Created by Ran Loock on 03/07/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation
import FirebaseAuth

var currentUser: User?

struct ProfileSQL: Decodable {
    var id: Int
    var nickname: String
    var pic: String
    var rating: Float
    var email: String
    var activeproductid: Int
}

func firebase2ProfileSQL()->ProfileSQL?{
    guard let mUser = Auth.auth().currentUser else {return nil}
  //  let photoURL = mUser.photoURL ??
    let nickname = mUser.displayName ?? ""
    let email = mUser.email ?? ""
    let rating = 0.0
    let active = 0
    return ProfileSQL(id: 0, nickname: nickname, pic: , rating: <#T##Float#>, email: <#T##String#>, activeproductid: <#T##Int#>)
    
    
}

func uploadProfile(profile: ProfileSQL){
    
    //let mPhotoURL = mUser.photoURL ??
    
}

func profileSQL2internal(profileSQL: ProfileSQL) -> Profile{
    return Profile(ID: profileSQL.id, nickname: profileSQL.nickname, pic: profileSQL.pic, rating: Double(profileSQL.rating), email: profileSQL.email, activeProductID: profileSQL.activeproductid)
}

struct Profile {
    var ID: Int
    var nickname: String
    var pic: String
    var rating: Double
    var email: String
    var activeProductID: Int
}

let u1 = Profile(ID: 1, nickname: "Jiff the Giraffe", pic: "https://cdn.iwastesomuchtime.com/11292012211233.jpg", rating: 1, email: "",activeProductID: 1)
let u2 = Profile(ID: 2, nickname: "Silly McSeal", pic: "https://media.tenor.com/images/e5b6345e033bb8d3918f31aea81101cc/tenor.png", rating: 4.5, email: "",activeProductID: 1)
let u3 = Profile(ID: 3, nickname: "Afro Sloth", pic: "https://img.clipartxtras.com/12a60f9fed276debec3b909f83f23074_nope-funny-derpy-sloth-drawing_600-450.jpeg", rating: 3, email: "",activeProductID: 1)
let u4 = Profile(ID: 4, nickname: "Afro", pic: "https://img.clipartxtras.com/12a60f9fed276debec3b909f83f23074_nope-funny-derpy-sloth-drawing_600-450.jpeg", rating: 3, email: "",activeProductID: 1)
let u5 = Profile(ID: 5, nickname: "Ouchstriche", pic: "https://aminus3.s3.amazonaws.com/image/g0005/u00004960/i00214121/6d2f4fce2d8dea77054a68c4fdab906f_large.jpg", rating: 4.5, email: "", activeProductID: 1)
let u6 = Profile(ID: 5, nickname: "Mr Empty", pic: "https://aminus3.s3.amazonaws.com/image/g0005/u00004960/i00214121/6d2f4fce2d8dea77054a68c4fdab906f_large.jpg", rating: 4.5, email: "", activeProductID: <#Int#>)
var profiles: [Profile] = [u1, u2, u3, u4, u5, u6]
