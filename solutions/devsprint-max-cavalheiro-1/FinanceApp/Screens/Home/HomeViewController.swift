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
    private let homeView: HomeView = {

        let homeView = HomeView()
        return homeView
    }()

    override func viewDidLoad() {

        navigationItem.title = "Finance App 💰"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Photo")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(clickOnAvatar))
        
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
    
    override func viewDidAppear(_ animated: Bool) {
        recurseViews(view: (navigationController?.navigationBar)!)
    }
    
    func recurseViews(view:UIView) {
            view.layer.cornerRadius = 20
        for viewAvatar in view.subviews { recurseViews(view: viewAvatar) }
    }
    
    @objc func clickOnAvatar() {
        delegate?.onClickAvatarButton()
        print("Clicou no avatar")
    }
}
