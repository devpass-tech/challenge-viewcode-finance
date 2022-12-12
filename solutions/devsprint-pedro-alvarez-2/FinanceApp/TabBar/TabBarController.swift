//
//  TabBarController.swift
//  FinanceApp
//
//  Created by Henrique Marques on 07/12/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTabBar()
    }
    
    func initTabBar() {
        let screen01 = UINavigationController(rootViewController: HomeViewController())
        let screen02 = UINavigationController(rootViewController: TransfersViewController())
        
        self.setViewControllers([screen01, screen02], animated: true)
        
        guard let items = tabBar.items else {return}
        
        items[0].title = "Home"
        items[0].image = UIImage(named: "house.fill")
        items[1].title = "Transfers"
        items[1].image = UIImage(named: "arrow.up.arrow.down")
    }

}
