//
//  ContactListView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ContactListView: UIView {
    
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
    
    private let imagePerson: UIImageView = {
       let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.backgroundColor = .gray
        image.contentMode = .scaleToFill
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        label.text = "Ronald Robertson"
        return label
    }()
    
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .gray
        label.font = .boldSystemFont(ofSize: 13)
        label.textAlignment = .left
        label.text = "+55 (11)99999-9999"
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private func confighierarchy() {
//        addSubview(titleLabel)
        addSubview(imagePerson)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(phoneLabel)
    }
    
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
//            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32.0),
//            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            imagePerson.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
            imagePerson.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10),
            
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0),
            stackView.leadingAnchor.constraint(equalTo: imagePerson.leadingAnchor, constant: 24.0),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24.0),
        ])
    }

}
