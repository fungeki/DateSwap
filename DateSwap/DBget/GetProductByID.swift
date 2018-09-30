//
//  GetProductByID.swift
//  DateSwap
//
//  Created by Ran Loock on 30/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

func getProductByID(id: Int, completion: ((_ product: Product) -> Void)? = nil){
    let url = "http://dateswap.herokuapp.com/getproduct?id=\(id)"
    guard let urlObj = URL(string: url) else {return}
    
    URLSession.shared.dataTask(with: urlObj) { (data, response, ic_user) in
        DispatchQueue.main.async {
            
            
            guard let data = data else {return}
            
            do{
                let mProduct = try JSONDecoder().decode([ProductExpSQL].self, from: data)
                let prod = arrayProductsSQL2LocalForOnlineUser(array: mProduct)
                let outprod = prod[0]
                if completion != nil {
                    completion!(outprod)
                }
                
            }catch {
                print(error)
            }
        }
        }.resume()
    
}
