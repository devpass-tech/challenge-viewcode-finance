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
    
    private (set) lazy var profileButton: UIBarButtonItem = {
        let image = UIImage(named: "profile-icon")
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        return barButton
    }()

    override func viewDidLoad() {

        navigationItem.title = "Finance App 💰"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = profileButton

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

extension HomeViewController: ProfileButtonProtocol {
    @objc func profileButtonTapped(_ sender:UIBarButtonItem!) {
        print("profileButtonTapped")
    }
}


protocol ProfileButtonProtocol {
    func profileButtonTapped(_ sender:UIBarButtonItem!)
}
