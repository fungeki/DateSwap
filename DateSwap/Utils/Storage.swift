//
//  Storage.swift
//  DateSwap
//
//  Created by Ran Loock on 06/09/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

// Get a reference to the storage service using the default Firebase App
let storage = Storage.storage()

// Create a storage reference from our storage service
let storageRef = storage.reference()

