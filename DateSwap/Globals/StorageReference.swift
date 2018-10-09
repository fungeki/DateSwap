//
//  StorageReference.swift
//  DateSwap
//
//  Created by Ran Loock on 14/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

// Get a reference to the storage service using the default Firebase App
let storage = Storage.storage()
// Create a root reference
let storageRef = storage.reference()

//referneces to child Storages
let productsStorageRef = storageRef.child("products")
let usersStorageRef = storageRef.child("users")

var dataRef: DatabaseReference!
