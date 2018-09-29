//
//  PushWish.swift
//  DateSwap
//
//  Created by Ran Loock on 30/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

func pushWish(){
    let strToUp = "http://dateswap.herokuapp.com/addwish?userid=\(gOnlineUser.ID)&prodid="
    guard let escapedStr = strToUp.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
        print("failed encoding string")
        return}
    guard let objUrl = URL(string: escapedStr) else {
        print("failed to objectify url to string")
        return
    }
    URLSession.shared.dataTask(with: objUrl) { (data, res, err) in
        DispatchQueue.main.async {
            
        }
        }.resume()
}
