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
    
    struct StoryBoard {
        static let ProductFeedCell = "ProductFeedCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "TAKE A LOOK!"
        fetchProducts()
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewController.StoryBoard.ProductFeedCell, for: indexPath) as! ProductFeedCell
        
        if let products = products {
            let product = products[indexPath.row]
            cell.product = product
        }

        return cell
    }
 

    

}
