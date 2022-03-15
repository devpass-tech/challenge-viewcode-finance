//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ContactListViewController: UIViewController {
    
    override func loadView() {
        self.view = ContactListView()
    }
    
 override func viewDidLoad() {
     self.navigationItem.title = "Contatos list"

  }
}
