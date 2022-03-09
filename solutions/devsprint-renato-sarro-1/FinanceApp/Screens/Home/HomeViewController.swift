//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class HomeViewController: UIViewController {

    private let service: FinanceServiceProtocol
    private let thread: DispatchQueue
    
    lazy var profileBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Avatar"), for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 36, height: 36)
        return btn
    }()
    
    private let homeView: HomeView = {

        let homeView = HomeView()
        return homeView
    }()
    
    init(service: FinanceServiceProtocol = FinanceService(), thread: DispatchQueue = .main) {
        self.service = service
        self.thread = thread
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        navigationItem.title = "Finance App 💰"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let itemBtn = UIBarButtonItem(customView: profileBtn)
        self.navigationItem.setRightBarButton(itemBtn, animated: true)

        service.fetchHomeData { homeData in

            guard let homeData = homeData else {
                return
            }

            let configuration = HomeViewConfiguration(homeData: homeData)

            self.thread.async {
                self.homeView.updateView(with: configuration)
            }
        }
    }
}
