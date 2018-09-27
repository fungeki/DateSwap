//
//  GetMyProducts.swift
//  DateSwap
//
//  Created by Ran Loock on 08/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

func getMyProducts(){

    let myID = gOnlineUser.ID
    let myStringURL = "http://dateswap.herokuapp.com/userproductdb?userid=\(myID)"
    guard let objURL = URL(string: myStringURL) else {return}
    URLSession.shared.dataTask(with: objURL) { (data, res, err) in
        guard let data = data else {return}
        DispatchQueue.main.async {
            do{
            let mProducts = try JSONDecoder().decode([ProductExpSQL].self, from: data)
            gOnlineUserProducts = arrayProductsSQL2LocalForOnlineUser(array: mProducts)
                if JustHUD.shared.isActive{
                    JustHUD.shared.hide()
                }

            } catch {
                guard let err = err else {return}
                print(err)
            }
        }
    }.resume()
}
