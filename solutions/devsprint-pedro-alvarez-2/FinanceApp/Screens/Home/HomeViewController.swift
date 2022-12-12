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

    override func viewDidLoad() {

        navigationItem.title = "Finance App 💰"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupProfileImage()

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

    private func setupProfileImage() {
        let barButton = UIBarButtonItem()
        barButton.customView = ProfileButtonView()
        self.navigationItem.rightBarButtonItem = barButton
    }

}
