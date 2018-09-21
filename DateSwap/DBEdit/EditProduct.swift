//
//  EditProduct.swift
//  DateSwap
//
//  Created by Ran Loock on 16/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

func editProduct(myProductInSQL: ProductExpSQL, controller: EditMyProductsViewController){
    let strToEdit = "http://dateswap.herokuapp.com/stallproductedit?id=\(myProductInSQL.id)&title=\(myProductInSQL.title)&image=\(myProductInSQL.image)&description=\(myProductInSQL.description)&condition=\(myProductInSQL.condition)&price=\(myProductInSQL.price)"
        guard let escapedStr = strToEdit.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            print("failed encoding string")
            return}
        guard let objUrl = URL(string: escapedStr) else {
            print("failed to objectify url to string")
            return
        }
    
        URLSession.shared.dataTask(with: objUrl) { (data, res, err) in
            DispatchQueue.main.async {
                var i = 0
                for prod in gOnlineUserProducts {
                    if prod.ID == myProductInSQL.id{
                        gOnlineUserProducts[i] = productSQL2Local(product: myProductInSQL)
                    }
                    i += 1
                }
                controller.backToMyStall()
            }
            }.resume()
//    let strToUp = "http://dateswap.herokuapp.com/addproduct?userid=\(gOnlineUser.ID)&title=\(uploadThis.title)&image=\(uploadThis.image)&description=\(uploadThis.description)&lastupdate=NOW()&condition=\(uploadThis.condition)&price=\(uploadThis.price)"
//    guard let escapedStr = strToUp.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
//        print("failed encoding string")
//        return}
//    guard let objUrl = URL(string: escapedStr) else {
//        print("failed to objectify url to string")
//        return
//    }
//    URLSession.shared.dataTask(with: objUrl) { (data, res, err) in
//        DispatchQueue.main.async {
//
//            do{
//
//            }catch {
//            }
//        }
//        }.resume()
}
