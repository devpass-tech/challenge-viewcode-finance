//
//  TabBarViewController.swift
//  FinanceApp
//
//  Created by Pedro Léda on 12/04/22.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    // MARK: Properties
    // MARK: Initialization
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .systemBlue
        delegate = self
        setupNavigations()
    }
    
    // MARK: Methods
    
    private func setupNavigations() {
        viewControllers = [
            createNewNavigation(for: HomeViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house.fill")),
            createNewNavigation(for: TransfersViewController(), title: NSLocalizedString("Transfers", comment: ""), image: UIImage(systemName: "arrow.up.arrow.down"))]
    }
    
    func createNewNavigation(for rootViewController: UIViewController,
                             title: String,
                             image: UIImage?) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        return navigationController
    }
}
