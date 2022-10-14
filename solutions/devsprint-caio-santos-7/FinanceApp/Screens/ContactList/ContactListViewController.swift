//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ContactListViewController: UIViewController {
    let container = ContactListView()
    
    override func loadView() {
        self.view = container
    }
}


