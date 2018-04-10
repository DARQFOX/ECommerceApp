//
//  ShoppingBagTableViewController.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/9/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

class ShoppingBagTableViewController: UITableViewController {
    
    var products: [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchProducts()
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    func fetchProducts() {
        products = Product.fetchProducts()
        tableView.reloadData()
        
        // Here we are going to call FIrebase ro backend data
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Table view data source

extension ShoppingBagTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let products = products {
            return products.count + 4
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let products = products else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ShoppingBag.Cells.NUMBER_OF_ITEMS_CELL, for: indexPath) as! NumberOfItemsCell
            cell.numberOfItemsLabel.text = "0 ITEMs"
            return cell
        }
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ShoppingBag.Cells.NUMBER_OF_ITEMS_CELL, for: indexPath) as! NumberOfItemsCell
            
            cell.numberOfItemsLabel.text = products.count == 1 ? "\(products.count) ITEM" : "\(products.count) ITEMS"
            return cell
            
        } else if indexPath.row == products.count + 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ShoppingBag.Cells.SUBTOTAL_CELL, for: indexPath) as! SubtotalCell
            
            return cell
        } else if indexPath.row == products.count + 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ShoppingBag.Cells.TOTAL_CELL, for: indexPath) as! TotalCell
            
            return cell
        } else if indexPath.row == products.count + 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ShoppingBag.Cells.CHECKOUT_CELL, for: indexPath) as! CheckoutCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ShoppingBag.Cells.PRODUCT_IN_BAG_CELL, for: indexPath) as! ProductInBagCell
            
            cell.product = products[indexPath.row - 1]
            return cell
        }
    }
}
