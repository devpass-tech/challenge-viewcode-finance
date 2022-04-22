//
//  UserProfileView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class UserProfileView: UIView {
    
    private lazy var profileImage: UIImageView = {
        let image = UIImage(named: "person")
        let pfimage = UIImageView(image: image)
        pfimage.layer.cornerRadius = 50/2
        pfimage.clipsToBounds = true
        pfimage.translatesAutoresizingMaskIntoConstraints = false
        return pfimage
    }()
    
    private lazy var userName: UILabel = {
        let label = UILabel()
        label.text = "Irma flores"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var agency: UILabel = {
        let label = UILabel()
        label.text = "Agency 001"
        label.textColor = UIColor.lightGray.withAlphaComponent(0.9)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var account: UILabel = {
        let label = UILabel()
        label.text = "Account 123456-7"
        label.textColor = UIColor.lightGray.withAlphaComponent(0.9)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var bank: UILabel = {
        let label = UILabel()
        label.text = "Devpass bank"
        label.textColor = UIColor.lightGray.withAlphaComponent(0.9)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStyle() {
        backgroundColor = .white
    }
    func configureHierarchy() {
        addSubview(profileImage)
        addSubview(userName)
        addSubview(agency)
        addSubview(account)
        addSubview(bank)
    }
    func configureConstraints() {
        NSLayoutConstraint.activate([
        profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
        profileImage.centerXAnchor.constraint(equalTo: centerXAnchor),
        profileImage.heightAnchor.constraint(equalToConstant: 50),
        profileImage.widthAnchor.constraint(equalToConstant: 50),
        
        userName.topAnchor.constraint(equalTo: profileImage.bottomAnchor,constant: 10),
        userName.trailingAnchor.constraint(equalTo: trailingAnchor),
        userName.leadingAnchor.constraint(equalTo: leadingAnchor),
        
        agency.topAnchor.constraint(equalTo: userName.bottomAnchor,constant: 10),
        agency.trailingAnchor.constraint(equalTo: trailingAnchor),
        agency.leadingAnchor.constraint(equalTo: leadingAnchor),
        
        account.topAnchor.constraint(equalTo: agency.bottomAnchor, constant: 10),
        account.trailingAnchor.constraint(equalTo: trailingAnchor),
        account.leadingAnchor.constraint(equalTo: leadingAnchor),
        
        bank.topAnchor.constraint(equalTo: account.bottomAnchor, constant: 10),
        bank.trailingAnchor.constraint(equalTo: trailingAnchor),
        bank.leadingAnchor.constraint(equalTo: leadingAnchor)

        ])
    }
    
      
}
