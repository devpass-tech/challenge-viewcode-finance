//
//  UserProfileHeaderView.swift
//  FinanceApp
//
//  Created by Jamile Bastos on 09/08/22.
//

import Foundation
import UIKit

class UserProfileHeaderView: UIView {
    
    // MARK: - Components
    
    var userImage: UIImageView = {
        let image = UIImage(named: "Photo")
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var userProfileName: UILabel = {
        let userName = UILabel()
        userName.text = "Irma Flores"
        userName.font = .boldSystemFont(ofSize: 17)
        userName.textColor = .black
        userName.translatesAutoresizingMaskIntoConstraints = false
        return userName
    }()
    
    var userBankAgency: UILabel = {
        let userBankAgency = UILabel()
        userBankAgency.text = "Agency 0001"
        userBankAgency.font = .systemFont(ofSize: 15)
        userBankAgency.textColor = .gray
        userBankAgency.translatesAutoresizingMaskIntoConstraints = false
        return userBankAgency
    }()
    
    var userBankAccount: UILabel = {
        let userBankAccount = UILabel()
        userBankAccount.text = "Account 123456-7"
        userBankAccount.font = .systemFont(ofSize: 15)
        userBankAccount.textColor = .gray
        userBankAccount.translatesAutoresizingMaskIntoConstraints = false
        return userBankAccount
    }()
    
    var userBankName: UILabel = {
        let userBankName = UILabel()
        userBankName.text = "Devpass Bank"
        userBankName.font = .systemFont(ofSize: 15)
        userBankName.textColor = .gray
        userBankName.translatesAutoresizingMaskIntoConstraints = false
        return userBankName
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupUserImage()
        setupUserProfileName()
        setupUserBankAgency()
        setupUserBankAccount()
        setupUserBankName()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(userImage)
        addSubview(userProfileName)
        addSubview(userBankAgency)
        addSubview(userBankAccount)
        addSubview(userBankName)
    }
    
    private func setupUserImage() {
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            userImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            userImage.heightAnchor.constraint(equalToConstant: 100),
            userImage.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupUserProfileName() {
        NSLayoutConstraint.activate([
            userProfileName.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 10),
            userProfileName.centerXAnchor.constraint(equalTo: userImage.centerXAnchor)
        ])
    }
    
    private func setupUserBankAgency() {
        NSLayoutConstraint.activate([
            userBankAgency.topAnchor.constraint(equalTo: userProfileName.bottomAnchor, constant: 5),
            userBankAgency.centerXAnchor.constraint(equalTo: userProfileName.centerXAnchor)
        ])
    }
    
    private func setupUserBankAccount() {
        NSLayoutConstraint.activate([
            userBankAccount.topAnchor.constraint(equalTo: userBankAgency.bottomAnchor),
            userBankAccount.centerXAnchor.constraint(equalTo: userBankAgency.centerXAnchor)
        ])
    }
    
    private func setupUserBankName() {
        NSLayoutConstraint.activate([
            userBankName.topAnchor.constraint(equalTo: userBankAccount.bottomAnchor),
            userBankName.centerXAnchor.constraint(equalTo: userBankAccount.centerXAnchor)
        ])
    }
}
