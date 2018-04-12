//
//  ProductDetailTableViewController.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/3/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

class ProductDetailTableViewController: UITableViewController {
    
    var product: Product?
    
    @IBOutlet weak var productImagesHeaderView: ProductImagesHeaderView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = product?.name
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }


    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ProductFeed.Cells.PRODUCT_DETAIL_CELL, for: indexPath) as! ProductDetailCell
            if let product = product {
                cell.product = product
            }
            
            return cell
            
        } else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ProductFeed.Cells.BUY_BUTTON_CELL, for: indexPath) as! BuyButtonCell
            if let product = product {
                cell.product = product
            }
            
            return cell
            
        } else if indexPath.row == 2 {

            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ProductFeed.Cells.SHOW_PRODUCT_DETAIL_CELL, for: indexPath)
            
            cell.selectionStyle = .none
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ProductFeed.Cells.SUGGESTION_CELL, for: indexPath) as! SuggestionTableViewCell
            
            // TODO: - set product suggestion data here.
            
            return cell
        }
            
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return tableView.bounds.width + 68
        } else {
            return UITableViewAutomaticDimension
        }
        
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            if let cell = cell as? SuggestionTableViewCell {
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                cell.collectionView.reloadData()
                cell.collectionView.isScrollEnabled = false
            }
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.ProductFeed.Controllers.SHOW_IMAGES_PAGE_VC {
            if let imagesPageVC = segue.destination as? ProductImagesPageViewController {
                imagesPageVC.images = product?.images
                imagesPageVC.pageViewControllerDelegate = productImagesHeaderView
            }
        }
    }
    
    

}

// MARK: - UICollectionViewDataSource

extension ProductDetailTableViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.ProductFeed.Cells.SUGGESTION_COLLECTION_VIEW_CELL, for: indexPath) as! SuggestionCollectionViewCell
        
        // TODO: - set real data for product suggestions
        let products = Product.fetchProducts()
        cell.image = products[indexPath.item].images?.first
        
        return cell
    }
}

// MARK: - UICollectionDelegate

extension ProductDetailTableViewController: UICollectionViewDelegate {
    
}


extension ProductDetailTableViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 5.0
            layout.minimumInteritemSpacing = 2.5
            let itemSize = (collectionView.bounds.width - 5.0) / 2.0
            return CGSize(width: itemSize, height: itemSize)
        }
        
       return CGSize.zero
    }
}













