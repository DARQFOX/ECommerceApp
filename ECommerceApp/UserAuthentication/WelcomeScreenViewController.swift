//
//  LoginScreenViewController.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 4/10/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit
import Firebase

class WelcomeScreenViewController: UIViewController {
    
    @IBOutlet weak var createNewAccountButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var appNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonUILayout()
        
        Auth.auth().addStateDidChangeListener { (Auth, User) in
            if User != nil {
                // Just logged in successfully
                self.dismiss(animated: false, completion: nil)
            }
        }
        
        
        
    }
    
    func buttonUILayout() {
        createNewAccountButton.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
    }
}
