//
//  AppDelegate.swift
//  ECommerceApp
//
//  Created by PEARSON BASHAM on 3/20/18.
//  Copyright © 2018 darqfox. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        configureAppearance()
        
        return true
    }

    func configureAppearance() {
        UITabBar.appearance().tintColor = UIColor.black
        UITabBar.appearance().isTranslucent = false
        
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().isTranslucent = false
    }
}

