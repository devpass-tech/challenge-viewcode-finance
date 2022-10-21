//
//  UserProfileView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class UserProfileView: UIView {
    
    var userData = ["Phone", "E-mail", "Address"]
    var userModel = ["+55(11)99999-9999", "user@devpass.com", "Rua Bela Cintra, 495"]
    var testModel = ["Personal data", "Bank account", "Taxes"]
    var generalModel = ["Need help?", "About Devpass"]
    var appModel = ["App Version"]
    var versionModel = ["1.0 (1)"]
    
    private lazy var headerStackView: UserProfileHeaderView = {
        let stack = UserProfileHeaderView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UserProfileViewCell.self, forCellReuseIdentifier: UserProfileViewCell.identifier)
        tableView.register(UserProfileViewGeneralCell.self, forCellReuseIdentifier: UserProfileViewGeneralCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.configViews()
        self.buildHierarchy()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserProfileView: ViewCodable {
    
    func configViews (){
        backgroundColor = .white
    }
    
    func buildHierarchy(){
        addSubview(headerStackView)
        addSubview(tableView)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tableView.topAnchor.constraint(lessThanOrEqualTo: headerStackView.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension UserProfileView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "MY ACCOUNT"
        } else {
            return "GENERAL"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return userData.count + testModel.count
        } else {
            return generalModel.count + appModel.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row < 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserProfileViewCell.identifier, for: indexPath) as! UserProfileViewCell
            cell.configure(leftLabel: userData[indexPath.row] , rightLabel: userModel[indexPath.row])
            return cell
        } else if indexPath.section == 0 && indexPath.row > 2 && indexPath.row < 6 {
            let buttonCell = tableView.dequeueReusableCell(withIdentifier: UserProfileViewGeneralCell.identifier, for: indexPath) as! UserProfileViewGeneralCell
            buttonCell.configure(generalLabel: self.testModel[indexPath.row - 3])
            
            return buttonCell
            
        } else if indexPath.section == 1 && indexPath.row < 2 {
            let generalCell = tableView.dequeueReusableCell(withIdentifier: UserProfileViewGeneralCell.identifier, for: indexPath) as! UserProfileViewGeneralCell
            generalCell.configure(generalLabel: generalModel[indexPath.row])
            
            return generalCell
            
        } else {
            let versionCell = tableView.dequeueReusableCell(withIdentifier: UserProfileViewCell.identifier, for: indexPath) as! UserProfileViewCell
            versionCell.configure(leftLabel: appModel[indexPath.row - 2], rightLabel: versionModel[indexPath.row - 2])
            
            return versionCell
        }
    }
}
