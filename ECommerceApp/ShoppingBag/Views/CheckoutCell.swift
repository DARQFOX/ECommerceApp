//
//  CheckoutCell.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/9/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

class CheckoutCell: UITableViewCell {

    @IBOutlet weak var checkoutButton: UIButton!
    
    var product: Product! {
        didSet {
            checkoutButton.setTitle("CHECKOUT", for: [])
        }
    }

}
