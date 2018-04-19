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
    
    var imageLink: String? {
        didSet {
            if let imageLink = imageLink {
                ECFirebaseImage.downloadImage(uri: imageLink, completion: { (image, error) in
                    if error == nil, image != nil {
                       self.productImageView.image = image
                    }
                })
            }
        }
    }
    
}
