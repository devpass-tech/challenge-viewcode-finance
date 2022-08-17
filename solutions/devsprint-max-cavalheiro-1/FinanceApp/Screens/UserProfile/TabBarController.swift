//
//  TabBarController.swift
//  FinanceApp
//
//  Created by Debora.souza on 16/08/22.
//

import UIKit

class TabBarController: UITabBarController {
    
    private let homeViewController = UINavigationController(rootViewController: HomeViewController())
    private let transfersViewController = UINavigationController(rootViewController: TransfersViewController())
    
    init(){
        super.init(nibName: nil, bundle: nil)
        setupHomeViewController()
        setupTransferViewController()
        self.viewControllers = [homeViewController, transfersViewController]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTransferViewController() {
        let transferTabBar = UITabBarItem(title: "Transfer", image: UIImage(named: "arrow.up.arrow.down"), tag: 1)
        transfersViewController.tabBarItem = transferTabBar
    }
    
    private func setupHomeViewController() {
        let homeTabBar = UITabBarItem(title: "Home", image: UIImage(named: "house.fill"), tag: 0)
        homeViewController.tabBarItem = homeTabBar
    }
}
