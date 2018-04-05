//
//  ProductImageViewController.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/5/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

class ProductImageViewController: UIViewController {
    
    @IBOutlet weak var productImageView: UIImageView!
    
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.productImageView.image = image
    }
    

    
    // MARK: - Navigation


}
