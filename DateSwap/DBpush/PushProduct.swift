//
//  PushProduct.swift
//  DateSwap
//
//  Created by Ran Loock on 10/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

func pushProduct(uploadThis: ProductExpSQL, controller: EditMyProductsViewController){
    let strToUp = "http://dateswap.herokuapp.com/addproduct?userid=\(gOnlineUser.ID)&title=\(uploadThis.title)&image=\(uploadThis.image)&description=\(uploadThis.description)&lastupdate=NOW()&condition=\(uploadThis.condition)&price=\(uploadThis.price)"
    guard let escapedStr = strToUp.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
        print("failed encoding string")
        return}
    guard let objUrl = URL(string: escapedStr) else {
        print("failed to objectify url to string")
        return
    }
    URLSession.shared.dataTask(with: objUrl) { (data, res, err) in
        DispatchQueue.main.async {
            if gOnlineUserProducts[0].userID == 0{
                gOnlineUserProducts[0] = productSQL2Local(product: uploadThis)
            } else {
               gOnlineUserProducts.insert(productSQL2Local(product: uploadThis), at: 0)
            }
               getProductID(userid: gOnlineUser.ID, title: uploadThis.title, controller: controller)
               controller.backToMyStall()
        }
        }.resume()
}
