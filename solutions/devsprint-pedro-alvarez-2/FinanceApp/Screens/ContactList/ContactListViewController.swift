//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ContactListViewController: UIViewController {
    
    private let viewModel = ContactListViewModel()
    
    // MARK: - Private Properties UI
    private lazy var contactTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(ContactCellView.self, forCellReuseIdentifier: ContactCellView.identifier)
        return tableView
    }()
                               
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Contact List"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        confighierarchy()
        configConstraints()
        DispatchQueue.main.async {
            self.contactTableView.reloadData()
        }
    }
    
}

    extension ContactListViewController {
        // MARK: - Private Methods
        private func confighierarchy() {
            view.addSubview(contactTableView)
        }
        
        private func configConstraints() {
            NSLayoutConstraint.activate([
                
                contactTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                contactTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                contactTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                contactTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        }
    }

extension ContactListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCellView.identifier, for: indexPath) as? ContactCellView else { return UITableViewCell() }
        let contactList = viewModel.contactList[indexPath.row]
        cell.configureCell(with: contactList)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.contactList.count
    }
}

