//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class HomeViewController: UIViewController {

    private let service = FinanceService()

    private let homeView: HomeView = {
        let homeView = HomeView()
        return homeView
    }()
    
    private lazy var navigationButton: UIBarButtonItem = {
        let image = UIImage(systemName: "person.circle")
        let button = UIBarButtonItem(
            image: image, style: .plain, target: self,
            action: #selector(navigationButtonHandleTapped)
        )
        return button
    }()

    override func viewDidLoad() {

        navigationItem.title = "Finance App 💰"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = navigationButton
        
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
        super.loadView()
        self.view = homeView
    }
    
    @objc private func navigationButtonHandleTapped() {
        let viewController = UserProfileViewController()
        present(viewController, animated: true, completion: nil)
    }
}
