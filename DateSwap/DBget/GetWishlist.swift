//
//  GetWishlist.swift
//  DateSwap
//
//  Created by Ran Loock on 30/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

func getUserActiveWishlist(completion: ((_ amount: Int) -> Void)? = nil){
    let url = "http://dateswap.herokuapp.com/userwishactive?userid=\(gOnlineUser.ID)"
    guard let urlObj = URL(string: url) else {return}
    
    URLSession.shared.dataTask(with: urlObj) { (data, response, ic_user) in
        DispatchQueue.main.async {
            
            
            guard let data = data else {return}
            
            do{
                let mProduct = try JSONDecoder().decode([ProductExpSQL].self, from: data)
                let prod = arrayProductsSQL2LocalForOnlineUser(array: mProduct)
                gMyWishlistProducts = prod
                if completion != nil {
                    completion!(prod.count)
                }
                
            }catch {
                print(error)
            }
        }
        }.resume()
}
