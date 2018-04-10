//
//  TotalCell.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/9/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

class TotalCell: UITableViewCell {

    @IBOutlet weak var totalLabel: UILabel!
    
    var product: Product! {
        didSet {
            // totalLabel.text =
        }
    }

}
