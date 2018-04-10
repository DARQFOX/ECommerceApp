//
//  LoginScreenViewController.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/10/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    @IBOutlet weak var createNewAccountButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var appNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonUILayout()
        
    }
    
    func buttonUILayout() {
        createNewAccountButton.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
    }
}
