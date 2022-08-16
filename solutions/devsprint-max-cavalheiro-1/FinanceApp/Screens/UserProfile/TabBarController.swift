//
//  TabBarController.swift
//  FinanceApp
//
//  Created by Debora.souza on 16/08/22.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        
        let home = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: home)
        let homeTabBar = UITabBarItem(title: "Home", image: UIImage(named: "house.fill"), tag: 0)
        homeNavigationController.tabBarItem = homeTabBar
        
        let transfers = TransfersViewController()
        let transferNavigationController = UINavigationController(rootViewController: transfers)
        let transferTabBar = UITabBarItem(title: "Transfer", image: UIImage(named: "arrow.up.arrow.down"), tag: 1)
        homeNavigationController.tabBarItem = transferTabBar
    }
}
