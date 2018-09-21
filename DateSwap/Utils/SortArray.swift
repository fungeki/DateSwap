//
//  SortArray.swift
//  DateSwap
//
//  Created by Ran Loock on 18/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

func sortProductArrayByID(){

    gOnlineUserProducts = gOnlineUserProducts.sorted(by: { $0.ID < $1.ID })
}
