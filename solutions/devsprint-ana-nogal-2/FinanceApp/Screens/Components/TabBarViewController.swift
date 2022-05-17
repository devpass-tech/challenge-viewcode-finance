//
//  TabBarViewController.swift
//  FinanceApp
//
//  Created by Razee Hussein-Jamal on 5/17/22.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        viewControllers = [
            createNavigationController(with: TabItemModel(viewController: HomeViewController(), title: "Home", name: "house.fill")),
            createNavigationController(with: TabItemModel(viewController: TransfersViewController(), title: "Transfers", name: "arrow.up.arrow.down"))
        ]
    }
    
    private func createNavigationController(with model: TabItemModel) -> UINavigationController {
        let viewController = model.viewController
        viewController.title = model.title
        viewController.tabBarItem.image = UIImage(named: model.name)
        
        return UINavigationController(rootViewController: viewController)
    }
}

private struct TabItemModel {
    let viewController: UIViewController
    let title: String
    let name: String
}
