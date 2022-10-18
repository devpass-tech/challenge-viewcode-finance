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
        homeView.delegate = self
        customNavBar()
        profilePictureNavBar()

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
    
    private func customNavBar() {
        let configNavBar = UINavigationBarAppearance()
        configNavBar.backgroundColor = UIColor.systemBackground
        navigationController?.navigationBar.standardAppearance = configNavBar
        navigationController?.navigationBar.scrollEdgeAppearance = configNavBar
    }
    
    private func profilePictureNavBar() {
        let profilePicture = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        image.image = UIImage(named: "avatar-placeholder")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 22.5
        image.layer.masksToBounds = true
        profilePicture.addSubview(image)
        let rightBarButton = UIBarButtonItem(customView: profilePicture)
        navigationItem.rightBarButtonItem = rightBarButton
    }
}


extension HomeViewController: HomeViewDelegate {
    func didSelectActivity() {
        present(ContactListViewController(), animated: true)
    }
}
