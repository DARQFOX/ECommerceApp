//
//  ECUser.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/12/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

class ECUser {
    var username: String
    let uid: String
    var fullName: String
    var profileImage: UIImage?
    var email: String
    
    init(uid: String, username: String, profileImage: UIImage, email: String, fullName: String) {
        self.uid = uid
        self.username = username
        self.profileImage = profileImage
        self.email = email
        self.fullName = fullName
    }
    
    func save(completion: @escaping (Error?) -> Void) {
        // The reference to the database
        let ref = ECDatabaseReference.users(uid: uid).reference()
        
        // Set the value of the reference
        ref.setValue(convertToDictionary())
        
        // Save the user's profile image
        if let profileImage = self.profileImage {
            let fireBaseImage = ECFirebaseImage(image: profileImage)
            fireBaseImage.saveProfileImage(self.uid) { (error) in
                // This is called whenever the profile image is successfully uploaded - This takes time
                completion(error)
            }
        }
    }
    
    func convertToDictionary() -> [String : Any] {
        return [
            "uid" : uid,
            "username" : username,
            "fullname" : fullName,
            "email" : email
        ]
    }
    
}
