//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func showDetails()
}

class HomeViewController: UIViewController, HomeViewControllerProtocol {

    private let service = FinanceService()

    private lazy var homeView: HomeView = {
        let homeView = HomeView(delegate: self)
        return homeView
    }()

    override func viewDidLoad() {

        navigationItem.title = "Finance App 💰"
        navigationController?.navigationBar.prefersLargeTitles = true

        service.fetchHomeData { homeData in

            guard let homeData = homeData else {
                return
            }

            let configuration = HomeViewConfiguration(homeData: homeData)

            DispatchQueue.main.async {

                self.homeView.updateView(with: configuration)
            }
        }
    }

    override func loadView() {
        self.view = homeView
    }
    
    func showDetails() {
        
        let viewController = ActivityDetailsViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
        
//        present(ActivityDetailsViewController(), animated: true)
    }
    
}
