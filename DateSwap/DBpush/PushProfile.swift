//
//  PushProfile.swift
//  DateSwap
//
//  Created by Ran Loock on 06/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage


//injects user to DB
func pushUser(profileSQL: ProfileSQL){
    let nickname = profileSQL.nickname
    let email = profileSQL.email
    let pic = profileSQL.pic
    let urlString = "http://dateswap.herokuapp.com/addprofile?nickname=\(nickname)&pic=\(pic)&email=\(email)"

//    print(urlString)
    guard let escapedStr = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
        print("failed encoding string")
        return}
//    print(escapedStr)
    guard let objUrl = URL(string: escapedStr) else {
        print("failed to objectify url to string")
        return
    }
    
    URLSession.shared.dataTask(with: objUrl) { (data, res, err) in
        DispatchQueue.main.async {
            
            do{
                getMyProfile()
                
            }catch {
            }
        }
    }.resume()
    
}
