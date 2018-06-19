//
//  ShoppingCart.swift
//  ECommerceApp
//
//  Created by Pearson Basham on 6/18/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import Foundation
import Firebase

private let caTaxPercentage = 0.08
private let freeShippingLimit = 50.00
private let defaultShippingFee = 5.99

class ShoppingCart {
    var products: [Product]?
    var shipping: Double?
    var subtotal: Double?
    var tax: Double?
    var total: Double?
    
    class func add(product: Product) {
        let userUID = Auth.auth().currentUser!.uid
        let ref = ECDatabaseReference.users(uid: userUID).reference().child("shoppingCart")
        
        ref.runTransactionBlock({ (currentData: MutableData) -> TransactionResult in
            // the last-known state of the current shopping cart, nil if: there is no shopping, deletes items in shopping cart, user checks out
            var cart = currentData.value as? [String : Any] ?? [:]
            var productDictionary = cart["products"] as? [String : Any] ?? [:]
            
            // add the new product to the dictionary
            productDictionary[product.uid!] = product.productToDictionary()
            
            // re-calculate the detail of the shopping cart - total, subtotal, shipping, tax
            var subtotal: Double = 0
            var shipping: Double = 0
            var tax: Double = 0
            var total: Double = 0
            
            for (_, productDict) in productDictionary {
                if let productDict = productDict as? [String : Any] {
                    let price = productDict["price"] as! Double
                    subtotal += price
                }
            }
            
            if subtotal >= freeShippingLimit || subtotal == 0 {
                shipping = 0
            } else {
                shipping = defaultShippingFee
            }
            
            tax = (subtotal + shipping) * caTaxPercentage
            total = subtotal + tax
            // update back the values to cart
            cart["subtotal"] = subtotal
            cart["shipping"] = shipping
            cart["tax"] = tax
            cart["total"] = total
            cart["products"] = productDictionary
            
            currentData.value = cart
            return TransactionResult.success(withValue: currentData)
            
        }) { (error, committed, snapshot) in
            if let error = error {
                // Report the error to the user -- alert view
                print(error.localizedDescription)
            }
        }
    }
}
