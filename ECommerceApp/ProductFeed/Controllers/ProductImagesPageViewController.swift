//
//  ProductImagesPageViewController.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/5/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

class ProductImagesPageViewController: UIPageViewController {
    var images: [UIImage]?
    
    struct Storyboard {
        static let productImageViewController = "ProductImageViewController"
    }
    
    lazy var controllers: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        var controllers = [UIViewController]()
        
        if let images = self.images {
            for image in images {
                let productImageVC = storyboard.instantiateViewController(withIdentifier: Storyboard.productImageViewController)
                controllers.append(productImageVC)
            }
        }
        
        return controllers
    }()
    
    override func viewDidLoad() {
        
        automaticallyAdjustsScrollViewInsets = false
        
        dataSource = self
//        delegate = self
    }
}

// MARK: UIPageViewControllerDataSource

extension ProductImagesPageViewController : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let index = controllers.index(of: viewController) {
            if index > 0 {
                return controllers[index-1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        return nil
    }
}
