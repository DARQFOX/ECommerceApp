//
//  ProductDetailCell.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/3/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

class ProductDetailCell: UITableViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    
//    var product: Product? {
//        didSet {
//            productNameLabel.text = product?.name
//            productDescriptionLabel.text = product?.description
//        }
//    }

    
    var product: Product!
    
    func configureCell(withProduct product: Product) -> Void {

         self.product = product

        productNameLabel.text = self.product.name
        productDescriptionLabel.text = self.product.description

    }

}
