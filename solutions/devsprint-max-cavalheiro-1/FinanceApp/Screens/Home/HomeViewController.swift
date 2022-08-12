//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol goToProfileViewDelegate: AnyObject {
    func onClickAvatarButton()
}

class HomeViewController: UIViewController {

    weak var delegate: goToProfileViewDelegate?
    private let service = FinanceService()
    private let avatarImageSize: CGFloat = 34
    
    private let homeView: HomeView = {

        let homeView = HomeView()
        
        return homeView
    }()

    override func viewDidLoad() {
        
        navigationItem.title = "Finance App 💰"
       
        let avatarImage = UIImage(named: "Photo")?.withRenderingMode(.alwaysOriginal)
        let avatarImageView = UIImageView()
        avatarImageView.image = avatarImage
        
        avatarImageView.layer.cornerRadius = avatarImageSize / 2
        avatarImageView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: avatarImageSize),
            avatarImageView.heightAnchor.constraint(equalToConstant: avatarImageSize)
        ])
        
        let avatarBarButton = UIBarButtonItem(customView: avatarImageView)
        navigationItem.setRightBarButton(avatarBarButton, animated: false)
        
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
    
    @objc func clickOnAvatar() {
        delegate?.onClickAvatarButton()
        print("Clicou no avatar")
    }
}




