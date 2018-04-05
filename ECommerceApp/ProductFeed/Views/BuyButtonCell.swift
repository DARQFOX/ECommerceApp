//
//  BuyButtonCell.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/3/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

class BuyButtonCell: UITableViewCell {

    @IBOutlet weak var buyButton: UIButton!
    
//    var product: Product!
//    func configureCell(withProduct product: Product) -> Void {
//
//        self.product = product
//        buyButton.setTitle(String(format: "Buy %ld", self.product.price!), for: [])
//
//    }
    
    
    var product: Product! {
        didSet {
            buyButton.setTitle("BUY $\(product.price!)", for: [])
        }
    }

}
