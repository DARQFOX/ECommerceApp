//
//  FeedTableViewController.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/3/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {
    
    var products: [Product]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        navigationItem.title = Constants.ProductFeed.TITLE
        fetchProducts()
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    func fetchProducts() {
        products = Product.fetchProducts()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let products = products {
            return products.count
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ProductFeed.Cells.PRODUCT_FEED_CELL, for: indexPath) as! ProductFeedCell
        
        if let products = products {
            let product = products[indexPath.row]
            cell.product = product
        }

        return cell
    }
    
 
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
////         1.
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        let toViewController = storyboard.instantiateViewController(withIdentifier: "ProductDetailTableViewController") as! ProductDetailTableViewController
//        toViewController.product = products?[indexPath.row]
//        navigationController?.pushViewController(toViewController, animated: true)
//
//
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let products = self.products else { return }


        // 2.
        if segue.identifier == Constants.ProductFeed.Segues.DETAIL_VIEW_SEGUE {
            let viewController = segue.destination as! ProductDetailTableViewController

            if  let indexPath = tableView.indexPathForSelectedRow {
                viewController.product = products[indexPath.row]
            }
        }
    }
}
