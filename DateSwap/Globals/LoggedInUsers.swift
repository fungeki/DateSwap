//
//  LoggedInUsers.swift
//  DateSwap
//
//  Created by Ran Loock on 07/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation

//the user that is currently online.
var gOnlineUser = u6
//products on this user's stall
var gOnlineUserProducts = [Product]()
//item selected:
var gItemPlaceholder : Product?
//other user's profile:
var gUserProfile : Profile?
//online user's active item:
var gActiveProduct = noActiveProduct
//online user wishlist
var gMyWishlist = [Wish]()
var gMyWishlistProducts = [Product]()
