//
//  ConfirmationViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ConfirmationViewController: UIViewController {

    private let confirmationView: ConfirmationView = {
        let confirmationView = ConfirmationView()
        return confirmationView
    }()
    
    override func loadView() {
        self.view = confirmationView
    }
}
