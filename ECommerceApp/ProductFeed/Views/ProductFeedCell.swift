//
//  ProductFeedCell.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/3/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

class ProductFeedCell: UITableViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
   
    var product: Product! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        if let product = product {
            // Download the product image
            productImageView.image = nil
            if let imageLinks = product.imageLinks, let imageLink = imageLinks.first {
                ECFirebaseImage.downloadImage(uri: imageLink) { (image, error) in
                    if error == nil {
                        self.productImageView.image = image
                    }
                }
            }
            
//            productImageView.image = product.images?.first
            productNameLabel.text = product.name
            productPriceLabel.text = "$\(product.price!)"
        }
        
        
    }
}
