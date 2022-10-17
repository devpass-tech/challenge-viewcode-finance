//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ContactListViewController: UIViewController {
    
    private let container = ContactListView()
    
    override func loadView() {
        self.view = container
    }
}


