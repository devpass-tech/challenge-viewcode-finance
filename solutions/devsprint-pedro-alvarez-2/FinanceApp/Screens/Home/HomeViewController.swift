//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class HomeViewController: UIViewController {

    private let service = FinanceService()
    
    private let barButton = { imageName in
        let barButton = UIBarButtonItem()
        let profileButton = ProfileButtonView()
        profileButton.configureView(imageName)
        barButton.customView = profileButton
        barButton.action = #selector(redirectToUserProfile)
        return barButton
    }

    private let homeView: HomeView = {

        let homeView = HomeView()
        return homeView
    }()

    override func viewDidLoad() {

        navigationItem.title = "Finance App 💰"
        navigationItem.rightBarButtonItem =  barButton("avatar-placeholder")
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
    
    @objc private func redirectToUserProfile(){
        //TODO: Implement redirect to UserProfile
        print("TODO: implementar redirect")
    }

}
