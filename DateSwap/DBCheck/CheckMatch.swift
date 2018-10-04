//
//  CheckMatch.swift
//  DateSwap
//
//  Created by Ran Loock on 03/10/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

func checkMatch(like: Like ,completion: ((_ data: [Like]) -> Void)? = nil){
    let strToUp = "http://dateswap.herokuapp.com/checkmatchforlike?myproductid=\(like.myproductid)&hisproductid=\(like.hisproductid)"
    guard let objUrl = URL(string: strToUp) else {
        print("failed to objectify url to string")
        return
    }
    URLSession.shared.dataTask(with: objUrl) { (data, res, err) in
        DispatchQueue.main.async {
            guard let data = data else {return}
            do{
                var mLike = try JSONDecoder().decode([Like].self, from: data)
                mLike.append(like)
                if completion != nil{
                    completion!(mLike)
                }
            }catch{
                guard let err = err else {return}
                print(err)
            }
        }
        }.resume()
}
