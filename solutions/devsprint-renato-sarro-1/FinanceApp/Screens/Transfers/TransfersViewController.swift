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
