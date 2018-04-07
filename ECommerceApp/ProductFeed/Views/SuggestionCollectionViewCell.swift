//
//  SuggestionCollectionViewCell.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/6/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

class SuggestionCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    
    var image: UIImage! {
        didSet {
            imageView.image = image
            setNeedsLayout()
        }
    }
}
