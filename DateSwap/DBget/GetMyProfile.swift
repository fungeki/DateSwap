//
//  GetMyProfile.swift
//  DateSwap
//
//  Created by Ran Loock on 07/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

func getMyProfile(){
    guard let mUser = currentUser else {return}
    guard let email = mUser.email else {return}
    let stringURL = "http://dateswap.herokuapp.com/profilefromemail?email=\(email)"
    guard let objURL = URL(string: stringURL) else {return}
    URLSession.shared.dataTask(with: objURL) { (data, res, err) in
        DispatchQueue.main.async {
            guard let data = data else {return}
            do{
                let mProfileSQL = try JSONDecoder().decode([ProfileSQL].self, from: data)
                gOnlineUser = profileSQL2internal(profileSQL: mProfileSQL[0])
                getMyProducts()
            } catch{
                
            }
            
        }
    }.resume()
}
