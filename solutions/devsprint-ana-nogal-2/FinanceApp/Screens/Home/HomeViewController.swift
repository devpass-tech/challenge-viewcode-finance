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

        let homeView = HomeView(homeData: HomeViewConfiguration(homeData: HomeData(balance: 0, savings: 0, spending: 0, activity: [])))
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
}
