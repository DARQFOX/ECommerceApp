//
//  ProductImagesHeaderView.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/5/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

class ProductImagesHeaderView: UIView {
    
    @IBOutlet weak var pageControl: UIPageControl!

}

extension ProductImagesHeaderView : ProductImagesPageViewControllerDelegate {
    
    func setupPageController(numberOfPages: Int) {
        pageControl.numberOfPages = numberOfPages
    }
    
    func turnPageController(to index: Int) {
        pageControl.currentPage = index
    }
}
