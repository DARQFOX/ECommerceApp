//
//  Product.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/2/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit
import Firebase

class Product {
    var uid: String?
    var name: String?
    var images: [UIImage]?
    var price: Double?
    var description: String?
    var detailed: String?
    var relatedProductUID: [String]?
    
    var imageLinks: [String]?
    var featuredImageLink: String?
    
    init(uid: String?, name: String?, images: [UIImage]?, price: Double?, description: String?, detailed: String?, relatedProductUID: [String]? = ["875942-100", "880843-003", "384664-113", "805144-852"]) {
        
        self.uid = uid
        self.name = name
        self.images = images
        self.price = price
        self.description = description
        self.detailed = detailed
        self.relatedProductUID = relatedProductUID
    }
    
    class func fetchProducts() -> [Product] {
        var shoes = [Product]()
        
        // The following is dummy data being used until I create the backend using Firebase.
        
        // 1
        var shoe1Images = [UIImage]()
        for i in 1...8 {
            shoe1Images.append(UIImage(named: "s\(i)")!)
        }
        let shoe1 = Product(uid: "875942-100", name: "NIKE AIR MAX 1 ULTRA 2.0 FLYKNIT", images: shoe1Images, price: 180, description: "LIGHTER THAN EVER! The Nike Air Max 1 Ultra 2.0 Flyknit Men's Shoe updates the iconic original with an ultra-lightweight upper while keeping the plush, time-tested Max Air cushioning.", detailed: "LIGHTER THAN EVER! The Nike Air Max 1 Ultra 2.0 Flyknit Men's Shoe updates the iconic original with an ultra-lightweight upper while keeping the plush, time-tested Max Air cushioning.")
        shoes.append(shoe1)
        
        // 2
        var shoe2Images = [UIImage]()
        for i in 1...7 {
            shoe2Images.append(UIImage(named: "t\(i)")!)
        }
        let shoe2 = Product(uid: "880843-003", name: "NIKE FREE RN FLYKNIT 2017", images: shoe2Images, price: 120, description: "The Nike Free RN Flyknit 2017 Men's Running Shoe brings you miles of comfort with an exceptionally flexible outsole for the ultimate natural ride. Flyknit fabric wraps your foot for a snug, supportive fit while a tri-star outsole expands and flexes to let your foot move naturally.", detailed: "The Nike Free RN Flyknit 2017 Men's Running Shoe brings you miles of comfort with an exceptionally flexible outsole for the ultimate natural ride. Flyknit fabric wraps your foot for a snug, supportive fit while a tri-star outsole expands and flexes to let your foot move naturally.")
        shoes.append(shoe2)
        
        
        // 3
        var shoe3Images = [UIImage]()
        for i in 1...6 {
            shoe3Images.append(UIImage(named: "j\(i)")!)
        }
        let shoe3 = Product(uid: "384664-113", name: "AIR JORDAN 6 RETRO", images: shoe3Images, price: 190, description: "The Air Jordan 6 Retro Men's Shoe celebrates a championship heritage with design lines and plush cushioning inspired by the ground-breaking hoops original.", detailed: "The Air Jordan 6 Retro Men's Shoe celebrates a championship heritage with design lines and plush cushioning inspired by the ground-breaking hoops original.")
        shoes.append(shoe3)
        
        // 4
        var shoe4Images = [UIImage]()
        for i in 1...6 {
            shoe4Images.append(UIImage(named: "f\(i)")!)
        }
        let shoe4 = Product(uid: "805144-852", name: "TECH FLEECE WINDRUNNER", images: shoe4Images, price: 130, description: "The Nike Sportswear Tech Fleece Windrunner Men's Hoodie is redesigned for cooler weather with smooth, engineered fleece that offers lightweight warmth. Bonded seams lend a modern update to the classic chevron design.", detailed: "The Nike Sportswear Tech Fleece Windrunner Men's Hoodie is redesigned for cooler weather with smooth, engineered fleece that offers lightweight warmth. Bonded seams lend a modern update to the classic chevron design.")
        shoes.append(shoe4)
        
        return shoes
    }
}


// MARK: - Firebase

// Steps for providing products to user without an admin.
// 1. Create some prototype products locally
// 2. Upload the products programmatically
// 3. Fetch those products into customer's feed

extension Product {
    var ref: DatabaseReference! {
        get {
            if let uid = self.uid {
                return ECDatabaseReference.products(uid: uid).reference()
            } else {
                return nil
            }
        }
    }
    
    // 1.
    
    func saveProduct(completion: @escaping (Error?) -> Void) {
        // Save Images to Firebase Storage with the product UID
        if let images = images {
            for image in images {
                let firebaseImage = ECFirebaseImage(image: image)
                let randomID = ref.childByAutoId().key
                firebaseImage.save(randomID) { (error) in
                    // save the image downloadURL to product database
                    self.ref.child("images").childByAutoId().setValue(firebaseImage.downloadURL)
                    completion(error)
                }
            }
        }
        
        self.ref.setValue(productToDictionary())
    }
    
    func productToDictionary() -> [String : Any] {
        guard let uid = self.uid, let name = self.name, let price = price, let description = description, let detailed = detailed, let relatedProductUID = relatedProductUID else {
            return [:]
    }
        
        return [
            "uid" : uid,
            "name" : name,
            "price" : price,
            "description" : description,
            "detailed" : detailed,
            "relatedProductUID" : relatedProductUID,
        ]
    }
}



















