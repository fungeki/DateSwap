//
//  Profile.swift
//  DateSwap
//
//  Created by Ran Loock on 03/07/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

struct Profile {
    var ID: Int
    var nickname: String
    var pic: String
    var rating: Double
}

let u1 = Profile(ID: 1, nickname: "Jiff the Giraffe", pic: "https://cdn.iwastesomuchtime.com/11292012211233.jpg", rating: 1)
let u2 = Profile(ID: 2, nickname: "Silly McSeal", pic: "https://media.tenor.com/images/e5b6345e033bb8d3918f31aea81101cc/tenor.png", rating: 4.5)
let u3 = Profile(ID: 3, nickname: "Afro Sloth", pic: "https://img.clipartxtras.com/12a60f9fed276debec3b909f83f23074_nope-funny-derpy-sloth-drawing_600-450.jpeg", rating: 3)
let u4 = Profile(ID: 4, nickname: "Afro", pic: "https://img.clipartxtras.com/12a60f9fed276debec3b909f83f23074_nope-funny-derpy-sloth-drawing_600-450.jpeg", rating: 3)
let u5 = Profile(ID: 5, nickname: "Ouchstriche", pic: "https://aminus3.s3.amazonaws.com/image/g0005/u00004960/i00214121/6d2f4fce2d8dea77054a68c4fdab906f_large.jpg", rating: 4.5)
var profiles: [Profile] = [u1, u2, u3, u4, u5]
