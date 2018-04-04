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
    
    var products: Product! {
        didSet {
            buyButton.setTitle("Buy\(products.price!)", for: [])
        }
    }

}
