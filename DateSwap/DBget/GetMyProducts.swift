//
//  GetMyProducts.swift
//  DateSwap
//
//  Created by Ran Loock on 08/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

func getMyProducts(_ controller: EditMyProductsViewController? = nil){
    let myID = gOnlineUser.ID
    let myStringURL = "http://dateswap.herokuapp.com/userproductdb?userid=\(myID)"
    guard let objURL = URL(string: myStringURL) else {return}
    URLSession.shared.dataTask(with: objURL) { (data, res, err) in
        guard let data = data else {return}
        DispatchQueue.main.async {
            do{
            let mProducts = try JSONDecoder().decode([ProductExpSQL].self, from: data)
            gOnlineUserProducts = arrayProductsSQL2Local(array: mProducts)
                if JustHUD.shared.isActive{
                   JustHUD.shared.hide()
                }
                guard let mController = controller else {
                    print("no controller")
                    return
                }
                mController.backToMyStall()

            } catch {
                guard let err = err else {return}
                print(err)
            }
        }
    }.resume()
}
