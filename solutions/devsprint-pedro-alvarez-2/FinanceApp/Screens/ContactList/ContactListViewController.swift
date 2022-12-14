//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ContactListViewController: UIViewController {
    
//    override func loadView() {
//        self.view = ContactListView()
//    }
     
//    private var contactListView = ContactListView()
    
//    override func loadView() {
//        view = ContactListView(viewModel: ContactListModel(name: "+55 (11) 99999-9999",
//                                                           phone: "Ronald Robertson",
//                                                           image: UIImage(named: "img")))
//        }
   
                               
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Contact List"
        confighierarchy()
        configConstraints()
    }
    private lazy var contactCellView: ContactCellView = {
        let contactCellView = ContactCellView()
        return contactCellView
    }()
    // MARK: - Private Properties UI
//    private lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 0
//        label.textColor = .black
//        label.font = .boldSystemFont(ofSize: 20)
//        label.textAlignment = .left
//        label.text = "Contact List"
//        label.backgroundColor = .gray
//        return label
//    }()
    
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
}

    extension ContactListViewController {
        // MARK: - Private Methods
        private func confighierarchy() {
//            view.addSubview(titleLabel)
            view.addSubview(contactTableView)
        }
        
        private func configConstraints() {
            NSLayoutConstraint.activate([
            
//                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                contactTableView.topAnchor.constraint(equalTo: view.topAnchor),
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
        cell.textLabel?.text = contactList[indexPath.row].phone
        cell.imageView?.image = contactList[indexPath.row].image
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
}
