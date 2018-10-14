//
//  GetMyNotifications.swift
//  DateSwap
//
//  Created by Ran Loock on 11/10/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

func GetMyNotifications(completion: ((_ notifications: [Notification])->Void)? = nil){
    let strToUp = "http://dateswap.herokuapp.com/notificationsforuser?userid=\(gOnlineUser.ID)"
    guard let urlObj = URL(string: strToUp) else {return}
    
    URLSession.shared.dataTask(with: urlObj) { (data, res, err) in
        DispatchQueue.main.async {
            guard let data = data else {return}
            do{
                let mNotifications = try JSONDecoder().decode([Notification].self, from: data)
                if completion != nil{
                    completion!(mNotifications)
                }
            }catch{
                guard let err = err else {return}
                 print(err)
            }
        }
    }.resume()
    
}
