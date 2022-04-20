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
        let homeView = HomeView(action: .init(onItenSelect: {
            print("Clicou")
        }))
        return homeView
    }()
    
    private lazy var navigationButton: UIBarButtonItem = {
        let image = UIImage(named: "person")
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(navigationButtonHandleTapped), for: .touchUpInside)
        button.layer.cornerRadius = 50/2
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 36).isActive = true
        button.widthAnchor.constraint(equalToConstant: 36).isActive = true
        let barbutton = UIBarButtonItem(customView: button)
        return barbutton
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
   
    //MARK: - Selector
    @objc private func navigationButtonHandleTapped() {
        let viewController = UserProfileViewController()
        present(viewController, animated: true, completion: nil)
    }
}
