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
    lazy var acountButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "photo"), for: .normal)
        btn.addTarget(self, action: #selector(actionNavBarButton), for: .touchUpInside)
        btn.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        return btn
    }()
    @objc func actionNavBarButton(){
        let upv:UserProfileViewController = UserProfileViewController()
        navigationController?.present(upv, animated: true)
    }
    override func viewDidLoad() {

        navigationItem.title = "Finance App 💰"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: acountButton)
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
