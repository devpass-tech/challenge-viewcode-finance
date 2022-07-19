//
//  TabBarViewController.swift
//  FinanceApp
//
//  Created by Beto Moresca on 19/07/2022.
//

import UIKit

class TabBarViewcontroller: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupNavigation()
    }
    
    private func setupTabBar() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .systemBlue
        tabBar.clipsToBounds = true
        delegate = self
    }
    
    private func setupNavigation() {
        viewControllers = [
                    createNewButton(for: HomeViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house.fill")),
                    createNewButton(for: TransfersViewController(), title: NSLocalizedString("Transfers", comment: ""), image: UIImage(systemName: "arrow.up.arrow.down"))]
    }
    
    func createNewButton(for rootViewController: UIViewController,
                             title: String,
                             image: UIImage?) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        navigationController.navigationItem.title = title
        
        return navigationController
    }
}
