//
//  GetMyItemOffers.swift
//  DateSwap
//
//  Created by Ran Loock on 24/10/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

func getMyItemOffers(myItemID: Int,completion: ((_ notifications: NotificationWithPic)->Void)? = nil){
    let strToUp = "http://dateswap.herokuapp.com/notificationsforitem?prodid=\(myItemID)"
    guard let myURL = URL(string: strToUp) else {
        print("error encoding URL at getMyItemOffers")
        return
    }
    URLSession.shared.dataTask(with: myURL) { (data, res, err) in
        DispatchQueue.main.async {
            guard let data = data else {
                print("no data at getMyItemOffers")
                return
            }
            do{
            let notifications = try JSONDecoder().decode([NotificationWithPic].self, from: data)
                guard let completion = completion else {
                    return
                }
                completion(notifications[0])
            } catch {
                print(err ?? "error")
            }
            
        }
    }.resume()
}
