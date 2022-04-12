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
    }
    // MARK: Actions
    // MARK: Methods
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
