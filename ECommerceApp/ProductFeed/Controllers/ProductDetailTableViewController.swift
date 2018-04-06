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
    
    struct Storyboard {
        static let showImagesPageVC = "ProductImagesPageViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = product?.name
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }


    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.PRODUCT_DETAIL_CELL, for: indexPath) as! ProductDetailCell
            if product != nil {
                cell.product = product
            }
            
            cell.selectionStyle = .none
            return cell
            
        } else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.BUY_BUTTON_CELL, for: indexPath) as! BuyButtonCell
            if product != nil {
                cell.product = product
            }
            cell.selectionStyle = .none
            return cell
            
        } else if indexPath.row == 2 {

            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.SHOW_PRODUCT_DETAIL_CELL, for: indexPath)
            
            cell.selectionStyle = .none
            return cell
            
        } else {
            
            return UITableViewCell()
            
        }
            
    }
    
    // Mark: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showImagesPageVC {
            if let imagesPageVC = segue.destination as? ProductImagesPageViewController {
                imagesPageVC.images = product?.images
            }
        }
    }
    
    

}
