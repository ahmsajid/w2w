//
//  DataServices.swift
//  W2W
//
//  Created by A H M Masfiqur Rahman Sajid on 5/28/17.
//  Copyright © 2017 A H M Masfiqur Rahman Sajid. All rights reserved.
//

import Foundation
import UIKit
import Firebase

let DB_BASE = FIRDatabase.database().reference()

class DataService {
    static let ds = DataService()
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("post")
    private var _REF_USERS = DB_BASE.child("users")
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: FIRDatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) {
        //if user doesn't exist then Firebase will create it automatically
        REF_USERS.child(uid).updateChildValues(userData)
    }
}
