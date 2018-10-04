//
//  PushLike.swift
//  DateSwap
//
//  Created by Ran Loock on 01/10/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

func pushLike(myProdID: Int ,completion: ((_ data: Like) -> Void)? = nil){
    guard let mItem = gItemPlaceholder else {
        print("item error - no item!")
        return}
    let strToUp = "http://dateswap.herokuapp.com/addlike?userid=\(gOnlineUser.ID)&myproductid=\(myProdID)&hisproductid=\(mItem.ID)"

    guard let objUrl = URL(string: strToUp) else {
        print("failed to objectify url to string")
        return
    }
    URLSession.shared.dataTask(with: objUrl) { (data, res, err) in
        DispatchQueue.main.async {
            let myLike = Like(id: 0, myproductid: myProdID, hisproductid: mItem.ID, status: 0)
            if completion != nil{
                    completion!(myLike)
                }
            
            }
        }.resume()
}
