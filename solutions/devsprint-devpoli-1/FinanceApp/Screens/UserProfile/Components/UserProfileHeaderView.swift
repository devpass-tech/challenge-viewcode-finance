//
//  UserProfileHeaderView.swift
//  FinanceApp
//
//  Created by Vinicius Rocha on 22/04/22.
//

import UIKit

class UserProfileHeaderView: UIView {
    
    // MARK: Declare Views
       
    private lazy var userStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()

    private lazy var userAvatar: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 50
        image.layer.masksToBounds = true
        image.image = UIImage(named: "avatar-placeholder")
        image.tintColor = .systemGray
        return image
    }()

    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Irma Flores"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private lazy var userDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "Agency 0001\n Account 123456-7\n Devpass Bank"
        label.textAlignment = .center
        label.numberOfLines = 3
        label.textColor = .systemGray
        return label
    }()
    
    // MARK: Init Settings
        
    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension UserProfileHeaderView {
    
    // MARK: View and Constraint Settings
    
    func setupViews() {
        configureSubviews()
        configureConstraints()
    }

    func configureSubviews() {
        addSubview(userStack)

        userStack.addArrangedSubview(userAvatar)
        userStack.addArrangedSubview(userNameLabel)
        userStack.addArrangedSubview(userDescriptionLabel)
    }

    func configureConstraints() {

        NSLayoutConstraint.activate([
            userStack.widthAnchor.constraint(equalToConstant: 240),
            userStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 44),
            userStack.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),

            userAvatar.widthAnchor.constraint(equalToConstant: 100),
            userAvatar.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}

extension UserProfileHeaderView {

    // MARK: Populate View
    
    func setupUserProfileHeader(user: UserProfile) {
        setupName(name: user.name)
        setupDescription(account: user.account)
    }
    
    func setupName(name: String) {
        userNameLabel.text = name
    }
    
    func setupDescription(account: Account) {
        userDescriptionLabel.text = "Agency \(account.agency)\n Account \(account.account)\n Devpass Bank"
    }
}
