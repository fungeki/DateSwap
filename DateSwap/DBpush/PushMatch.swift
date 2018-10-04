//
//  PushMatch.swift
//  DateSwap
//
//  Created by Ran Loock on 04/10/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation


func pushMatch(likes: [Like] ,completion: (() -> Void)? = nil){
    
    if likes.count < 2 {
        print("invalid match!")
        return
    }
    let strToUp = "http://dateswap.herokuapp.com/addmatch?userid1=\(likes[0].id)&userid2=\(likes[1].id)&prodid1=\(likes[0].myproductid)&prodid2=\(likes[0].hisproductid)"
    
    guard let objUrl = URL(string: strToUp) else {
        print("failed to objectify url to string")
        return
    }
    URLSession.shared.dataTask(with: objUrl) { (data, res, err) in
        DispatchQueue.main.async {
            
            if completion != nil{
                completion!()
            }
            
        }
        }.resume()
}
