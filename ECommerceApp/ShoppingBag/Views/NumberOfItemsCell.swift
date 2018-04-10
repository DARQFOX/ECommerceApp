//
//  NumberOfItemsCell.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/9/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

class NumberOfItemsCell: UITableViewCell {

    @IBOutlet weak var numberOfItemsLabel: UILabel!
    
    var product: Product! {
        didSet {
            // numberOfItemsLabel.text = 
        }
    }

}
