//
//  GetProductID.swift
//  DateSwap
//
//  Created by Ran Loock on 21/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

struct IDs: Decodable {
    var id: Int
}

func getProductID(userid: Int, title: String, controller: EditMyProductsViewController){
    let strToUp = "http://dateswap.herokuapp.com/prodid?userid=\(userid)&title=\(title)"
    guard let escapedStr = strToUp.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
        print("failed encoding string")
        return}
    guard let objURL = URL(string: escapedStr) else {
        print("bad string url")
        return
    }
    URLSession.shared.dataTask(with: objURL) { (data, res, err) in
        DispatchQueue.main.async {
            do{
                guard let data = data else {
                    print("retrieving data from server fail at ID")
                    controller.backToMyStall()
                    return}
                let mIDs = try JSONDecoder().decode([IDs].self, from: data)
                let lastIDplace = mIDs.count - 1
                gOnlineUserProducts[0].ID = mIDs[lastIDplace].id
                print("my id is:")
                print(gOnlineUserProducts[0].ID)
                 print(gOnlineUserProducts[0].ID)
                 print(gOnlineUserProducts[0].ID)
                 print(gOnlineUserProducts[0].ID)
                controller.backToMyStall()
            }catch {
                guard let err = err else {return}
                print(err)
            }
        }
    }
    
}
