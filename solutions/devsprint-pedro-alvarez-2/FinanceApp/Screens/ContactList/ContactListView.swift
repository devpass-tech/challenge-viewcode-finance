//
//  ContactListView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ContactListView: UIView {
    
    // MARK: - Private Properties UI
     lazy var imagePerson: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 30
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.backgroundColor = .gray
        image.contentMode = .scaleToFill
        return image
    }()
    
     lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        return label
    }()
    
     lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .gray
        label.font = .boldSystemFont(ofSize: 13)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    // MARK: - Init
     init() {
        super.init(frame: .zero)
        confighierarchy()
        configConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
   
    }
    
    func getPopularView(image: String, name: String, phone: String) {
        imagePerson.image = UIImage(named: image)
        nameLabel.text = name
        phoneLabel.text = phone
    }
}


    extension ContactListView {
        // MARK: - Private Methods
        private func confighierarchy() {
            addSubview(imagePerson)
            addSubview(stackView)
            stackView.addArrangedSubview(nameLabel)
            stackView.addArrangedSubview(phoneLabel)
        }
        
        
        private func configConstraints() {
            NSLayoutConstraint.activate([
                
                imagePerson.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                imagePerson.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
                imagePerson.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                imagePerson.heightAnchor.constraint(equalToConstant: 60.0),
                imagePerson.widthAnchor.constraint(equalToConstant: 60.0),
                
                stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                stackView.leadingAnchor.constraint(equalTo: imagePerson.trailingAnchor, constant: 20.0),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            ])
        }

    }
