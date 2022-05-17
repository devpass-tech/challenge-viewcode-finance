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
            configure(with: makeViewController(with: TabItemModel(viewController: HomeViewController(), title: "Home", name: "house.fill"))),
            configure(with: makeViewController(with: TabItemModel(viewController: TransfersViewController(), title: "Transfers", name: "arrow.up.arrow.down")))
        ]
    }
        
    private func makeViewController(with model: TabItemModel) -> UIViewController {
        let viewController = model.viewController
        viewController.title = model.title
        viewController.tabBarItem.image = UIImage(named: model.name)
        
        return viewController
    }
    
    private func configure(with viewController: UIViewController) -> UINavigationController {
        return UINavigationController(rootViewController: viewController)
    }
}

private struct TabItemModel {
    let viewController: UIViewController
    let title: String
    let name: String
}
