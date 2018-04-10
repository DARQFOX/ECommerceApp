//
//  ProductInBagCell.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/9/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

class ProductInBagCell: UITableViewCell {

    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var removeProductButton: UIButton!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    var product: Product! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        productImage.image = product!.images!.first
        productNameLabel.text = product!.name
        productPriceLabel.text = "$\(product!.price!)"
        removeProductButton.setTitle("REMOVE", for: [])
    }

}
