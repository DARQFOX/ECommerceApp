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
    
    /*
    var product: Product? {
        didSet {
            updateUI()
        }
    } */
    
    var product: Product!
    func configureCell(withProduct product: Product) -> Void {
        
        self.product = product
        
        updateUI(product: self.product)
        
    }
    
    func updateUI(product: Product) {
        if product != nil {
            productImageView.image = product.images?.first
            productNameLabel.text = product.name
            productPriceLabel.text = "\(product.price!)"
        }
    }


}
