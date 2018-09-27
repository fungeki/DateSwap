//
//  GetMyActiveProduct.swift
//  DateSwap
//
//  Created by Ran Loock on 25/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

func getMyActiveProduct(){
    
    let myID = gOnlineUser.activeProductID
    if myID == 0 {
        return
    }
    let myStringURL = "http://dateswap.herokuapp.com/getproduct?id=\(myID)"
    guard let objURL = URL(string: myStringURL) else {return}
    URLSession.shared.dataTask(with: objURL) { (data, res, err) in
        guard let data = data else {return}
        DispatchQueue.main.async {
            do{
                let mProducts = try JSONDecoder().decode([ProductExpSQL].self, from: data)
                if mProducts.count == 0{
                    gActiveProduct = noActiveProduct
                } else {
                    gActiveProduct = productSQL2Local(product: mProducts[0])
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "activeProduct"), object: nil)
                }
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
