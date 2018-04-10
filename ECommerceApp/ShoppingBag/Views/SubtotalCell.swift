//
//  SubtotalCell.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/9/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

class SubtotalCell: UITableViewCell {

    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var estimatedShippingLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    
    var product: Product! {
        didSet {
            subtotalLabel.text = "$\(product!.price!)"
            // estimatedShippingLabel
            // taxLabel
        }
    }

}
