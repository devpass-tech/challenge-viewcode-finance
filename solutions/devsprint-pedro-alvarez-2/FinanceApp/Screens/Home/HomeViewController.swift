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
//
    let accountView: AccountSummaryView = {
        let accountView = AccountSummaryView()
        return accountView
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

//    override func loadView() {
//        self.view = homeView
//    }
}

extension HomeViewController {
    private func setupViews() {
        confighierarchy()
        configConstraints()
    }
    
    private func confighierarchy() {
        view.addSubview(accountView)
        view.addSubview(homeView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            accountView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            accountView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            accountView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            homeView.topAnchor.constraint(equalTo: accountView.bottomAnchor),
            accountView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            accountView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}
