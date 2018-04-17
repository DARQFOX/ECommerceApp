//
//  FirebaseReference.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/11/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import Foundation
import Firebase

enum ECDatabaseReference {
    case root
    case users(uid: String)
    case products(uid: String)
    
    func reference() -> DatabaseReference {
        switch self {
        case .root:
            return rootRef
        default:
            return rootRef.child(path)
        }
    }
    
    private var rootRef: DatabaseReference {
        return Database.database().reference()
    }
    
    private var path: String {
        switch self {
        case .root:
            return ""
        case .users(let uid):
            return "users/\(uid)"
        case .products(let uid):
            return "products/\(uid)"
        }
    }
}

enum ECStorageReference {
    case root
    case profileImages
    case images 
    
    func reference() -> StorageReference {
        switch self {
        case .root:
            return rootRef
        default:
            return rootRef.child(path)
        }
    }
    
    private var rootRef: StorageReference {
        return Storage.storage().reference()
    }
    
    private var path: String {
        switch self {
        case .root:
            return ""
        case .profileImages:
            return "profileImages"
        case .images:
            return "images"
        }
    }
}




















