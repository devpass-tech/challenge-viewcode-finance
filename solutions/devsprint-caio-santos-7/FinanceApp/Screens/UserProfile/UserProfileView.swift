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
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UserProfileViewCell.self, forCellReuseIdentifier: UserProfileViewCell.identifier)
//        tableView.register(UserProfileViewGeneralCell.self, forCellReuseIdentifier: UserProfileViewGeneralCell.identifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserProfileView: ViewCodable {
    
    func buildHierarchy() {
        addSubview(headerStackView)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tableView.topAnchor.constraint(lessThanOrEqualTo: headerStackView.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = .init(hexString: "#F2F2F7")
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
            let buttonCell: UITableViewCell = .createCell(for: tableView, at: indexPath)!
            buttonCell.textLabel?.text = self.testModel[indexPath.row - 3]
            buttonCell.accessoryType = .disclosureIndicator
            return buttonCell
        } else if indexPath.section == 1 && indexPath.row < 2 {
            let buttonCell: UITableViewCell = .createCell(for: tableView, at: indexPath)!
            buttonCell.textLabel?.text = generalModel[indexPath.row]
            buttonCell.accessoryType = .disclosureIndicator
            return buttonCell
        } else {
            let versionCell = tableView.dequeueReusableCell(withIdentifier: UserProfileViewCell.identifier, for: indexPath) as! UserProfileViewCell
            versionCell.configure(leftLabel: appModel[indexPath.row - 2], rightLabel: versionModel[indexPath.row - 2])
            return versionCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Chamar um método
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
