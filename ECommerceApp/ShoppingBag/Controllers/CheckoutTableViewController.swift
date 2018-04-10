//
//  CheckoutTableViewController.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/10/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

class CheckoutTableViewController: UITableViewController {
    
    var productsToBuy: Product!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

// MARK: - Table view data source

extension CheckoutTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ShoppingBag.Cells.BILLING_INFORMATION_CELL, for: indexPath) as! BillingInformationCell
            
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ShoppingBag.Cells.CREDIT_CARD_INFORMATION_CELL, for: indexPath) as! CreditCardInformationCell
            
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ShoppingBag.Cells.SUBTOTAL_CELL, for: indexPath) as! SubtotalCell
            
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ShoppingBag.Cells.TOTAL_CELL, for: indexPath) as! TotalCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ShoppingBag.Cells.SUBMIT_ORDER_CELL, for: indexPath)
            
            return cell
        }
    }
}
