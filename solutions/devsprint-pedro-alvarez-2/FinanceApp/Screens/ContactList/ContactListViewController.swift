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
        
        confighierarchy()
        configConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    private lazy var contactCellView: ContactCellView = {
        let contactCellView = ContactCellView()
        return contactCellView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        label.text = "Contact List"
        label.backgroundColor = .gray
        return label
    }()
    
    private lazy var contactTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(ContactCellView.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        return tableView
    }()
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}

    extension ContactListViewController {
       
        private func confighierarchy() {
            view.addSubview(titleLabel)
            view.addSubview(contactTableView)
        }
        
        private func configConstraints() {
            NSLayoutConstraint.activate([
            
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                contactTableView.topAnchor.constraint(equalTo: titleLabel.topAnchor),
                contactTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                contactTableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                contactTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
    }

extension ContactListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = contactList[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
}
