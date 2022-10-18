//
//  UserProfileHeaderView.swift
//  FinanceApp
//
//  Created by Cleber Reis on 18/10/22.
//

import UIKit

final class UserProfileHeaderView: UIView {
    
    private lazy var stackViewProfile: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .center
        
        return stack
    }()
    
    private lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "avatar-placeholder")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 40
        image.layer.masksToBounds = true
        
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Irma Flores"
        label.textColor = .black
        
        return label
    }()
    
    private lazy var agencyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Agency 001"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        
        return label
    }()
    
    private lazy var accountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Account 123456-7"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        
        return label
    }()
    
    private lazy var bankLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "DEVPASS Bank"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray5
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserProfileHeaderView: ViewCodable {
    
    func buildHierarchy() {
        addSubview(stackViewProfile)
        stackViewProfile.addArrangedSubview(profileImage)
        stackViewProfile.addArrangedSubview(titleLabel)
        stackViewProfile.addArrangedSubview(agencyLabel)
        stackViewProfile.addArrangedSubview(accountLabel)
        stackViewProfile.addArrangedSubview(bankLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackViewProfile.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            stackViewProfile.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackViewProfile.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            stackViewProfile.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            profileImage.heightAnchor.constraint(equalToConstant: 80),
            profileImage.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    
}
