//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class TransfersViewController: UIViewController {
    // MARK: Properties
    private let transfersView: TransfersView = {
        let transfersView = TransfersView()
        return transfersView
    }()
    
    // MARK: Init
    override func loadView() {
        self.view = transfersView
    }
    
    override func viewDidLoad() {
        self.bindEvents()
        self.hideKeyboardWhenTappedOnScreen()
        self.navigationItem.setRightBarButtonItems([], animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appearance = UINavigationBarAppearance()
        
        appearance.shadowImage = UIImage()
        appearance.shadowColor = .clear
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        
        navigationController?.navigationBar.layoutIfNeeded()
    }
    
    // MARK: Methods
    private func bindEvents() {
        transfersView.didPressTransferButton = { [weak self] in
            print("transfer button tapped!")
        }
        
        transfersView.didPressChooseContactButton = { [weak self] in
            print("contact button tapped!")
        }
    }
}
