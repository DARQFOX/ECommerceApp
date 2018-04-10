//
//  ShoppingBagTableViewController.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/9/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

class ShoppingBagTableViewController: UITableViewController {
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    print("ViewController is connected")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NumberOfItemsCell", for: indexPath) as! NumberOfItemsCell
            
            if let product = product{
                cell.product = product
            }
            
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInBagCell", for: indexPath) as! ProductInBagCell
            
            if let product = product {
                cell.product = product
            }
            
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SubtotalCell", for: indexPath) as! SubtotalCell
            
            if let product = product {
                cell.product = product
            }
            
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TotalCell", for: indexPath) as! TotalCell
            
            if let product = product {
                cell.product = product
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutCell", for: indexPath) as! CheckoutCell
            
            if let product = product {
                cell.product = product
            }
            
            return cell
        }
        
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
