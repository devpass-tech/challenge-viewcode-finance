//
//  ContactListView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ContactListView: UIView {
    
    private var contact: [Contact] = [Contact(name: "julia", phone: "(11)0000-0000"), Contact(name: "Pedro", phone: "(11)0000-0000"), Contact(name: "Paula", phone: "(11)0000-0000")]
    
    private lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ContactListTableViewCell.self, forCellReuseIdentifier: ContactListTableViewCell.reuseId)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        
        self.configViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContactListView: ViewConfiguration {
    func configViews() {
        buildViews()
        setupConstraints()
    }
    
    func buildViews() {
        self.addSubview(self.tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension ContactListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contact.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:ContactListTableViewCell.reuseId, for: indexPath) as? ContactListTableViewCell else { return UITableViewCell() }
        
        cell.setupViews(model: contact[indexPath.row])
        
        return cell
    }
}

extension ContactListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
