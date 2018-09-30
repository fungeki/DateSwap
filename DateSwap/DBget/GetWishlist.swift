//
//  GetWishlist.swift
//  DateSwap
//
//  Created by Ran Loock on 30/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

func getWishlist(completion: ((_ amount: Int) -> Void)? = nil){
    let url = "http://dateswap.herokuapp.com/userwishactive?userid=\(gOnlineUser.ID)"
    guard let urlObj = URL(string: url) else {return}
    
    URLSession.shared.dataTask(with: urlObj) { (data, response, ic_user) in
        DispatchQueue.main.async {
            
            
            guard let data = data else {return}
            
            do{
                let mWishes = try JSONDecoder().decode([Wish].self, from: data)
                if mWishes.count > 0 {
                    var i = 0
                    for wish in mWishes{
                        getProductByID(id: wish.id, completion: { (prod) in
                            gMyWishlistProducts.append(prod)
                            i += 1
                            if i == mWishes.count{
                                if completion != nil {
                                    gSelectedCategory = "Wish List"
                                    gCategoryState = 10
                                    completion!(mWishes.count)
                                    return
                                }
                            }
                        })
                    }
                } else {
                    if completion != nil {
                        gSelectedCategory = "Wish List"
                        gCategoryState = 10
                        completion!(mWishes.count)
                        return
                    }
                }
                
                
                
            }catch {
                print(error)
            }
        }
        }.resume()
}
