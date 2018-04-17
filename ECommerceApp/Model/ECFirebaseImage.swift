//
//  FirebaseImage.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/12/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit
import Firebase

class ECFirebaseImage {
    
    var image: UIImage
    var downloadURL: String?
    var downloadString: String!
    var ref: StorageReference!
    
    init(image: UIImage) {
        self.image = image
    }
    
    func saveProfileImage(_ userUID: String, _ completion: @escaping (Error?) -> Void) {
        let resizedImage = image.resize()
        if let imageData = UIImageJPEGRepresentation(resizedImage, 0.9) {
        
            // To save in Firebase
            // 1. Get the reference
            
            ref = ECStorageReference.profileImages.reference().child(userUID)
            downloadString = ref.description
    
            // 2. Save the data to the reference
            ref.putData(imageData, metadata: nil) { (metadata, error) in
                completion(error)
            }
        }
    }
    
    func save(_ uid: String, completion: @escaping (Error?) -> Void) {
        let resizedImage = image.resize()
        let imageData = UIImageJPEGRepresentation(resizedImage, 0.9)
        
        ref = ECStorageReference.images.reference().child(uid)
        downloadURL = ref.description
        
        ref.putData(imageData!, metadata: nil) { (metaData, error) in
            completion(error)
        }
    }
}

private extension UIImage {
    
    func resize() -> UIImage {
        let height: CGFloat = 1000.0
        let ratio = self.size.width / self.size.height
        let width = height * ratio
        
        let newSize = CGSize(width: width, height: height)
        let newRectangle = CGRect(x: 0, y: 0, width: width, height: height)
        
        // Create the Canvas - Context
        UIGraphicsBeginImageContext(newSize)
        
        // Draw the newly sized image on said Canvas
        self.draw(in: newRectangle)
        
        // Get the new size image into a new variable
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // Close the Canvas
        UIGraphicsEndImageContext()
        
        return resizedImage!
    }
}

