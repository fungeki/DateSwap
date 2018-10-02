//
//  GetDisplayProduct.swift
//  DateSwap
//
//  Created by Ran Loock on 02/10/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

func getDisplayProduct(completion: (() -> Void)? = nil){
    let url = "http://dateswap.herokuapp.com/productsdb"
    guard let urlObj = URL(string: url) else {return}
    
    URLSession.shared.dataTask(with: urlObj) { (data, response, ic_user) in
        DispatchQueue.main.async {
            
            
            guard let data = data else {return}
            
            do{
                let mProducts = try JSONDecoder().decode([ProductExpSQL].self, from: data)
                var displayProducts = arrayProductsSQL2Local(array: mProducts)
                if displayProducts.count == 0 {
                    displayProducts.append(noProductToSwipe)
                }
                gProductsDisplayedPlaceholder = displayProducts
                gProductPlaceholderPlace = 0
                if ((completion) != nil){
                    completion!()
                }
                
            }catch {
                print(error)
            }
        }
        }.resume()
}
