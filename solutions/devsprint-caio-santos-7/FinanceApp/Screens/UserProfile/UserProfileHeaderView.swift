//
//  UserProfileHeaderView.swift
//  FinanceApp
//
//  Created by Cleber Reis on 18/10/22.
//

import UIKit

final class UserProfileHeaderView: UIStackView {
        
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
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UserProfileHeaderView: ViewCodable {
    
    func buildHierarchy() {
        addArrangedSubview(profileImage)
        addArrangedSubview(titleLabel)
        addArrangedSubview(agencyLabel)
        addArrangedSubview(accountLabel)
        addArrangedSubview(bankLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImage.heightAnchor.constraint(equalToConstant: 80),
            profileImage.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    func applyAdditionalChanges() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = 8
        alignment = .center
    }
}
