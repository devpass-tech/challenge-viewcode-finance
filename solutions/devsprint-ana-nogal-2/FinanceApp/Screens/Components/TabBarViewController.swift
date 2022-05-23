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
            configure(with: TabItemModel(viewController: ActivityDetailsViewController(), title: "Home", name: "house.fill")),
            configure(with: TabItemModel(viewController: TransfersViewController(), title: "Transfers", name: "arrow.up.arrow.down"))
        ]
    }
    
    private func configure(with model: TabItemModel) -> UINavigationController {
        let viewController = model.viewController
        viewController.tabBarItem.title = model.title
        viewController.tabBarItem.image = UIImage(named: model.name)
        
        return UINavigationController(rootViewController: viewController)
    }
}

private struct TabItemModel {
    let viewController: UIViewController
    let title: String
    let name: String
}
