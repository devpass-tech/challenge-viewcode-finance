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
        setupTabBar()
        setupNavigations()
    }
    
    // MARK: Methods
    private func setupTabBar() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .systemBlue
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.clipsToBounds = true
        delegate = self
    }
    
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
