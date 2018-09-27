//
//  EditProfile.swift
//  DateSwap
//
//  Created by Ran Loock on 24/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

func editProfilePicture(){
    
}

func editProfileNickname(newName: String){
    let strToUp = "http://dateswap.herokuapp.com/editnickname?id=\(gOnlineUser.ID)&nickname=\(newName)"
    guard let escapedStr = strToUp.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
        print("failed encoding string")
        return}
    guard let objUrl = URL(string: escapedStr) else {
        print("failed to objectify url to string")
        return
    }
    URLSession.shared.dataTask(with: objUrl) { (data, res, err) in
        DispatchQueue.main.async {
            gOnlineUser.nickname = newName
            if JustHUD.shared.isActive{
                JustHUD.shared.hide()
            }
        }
        }.resume()
}
