//
//  ContactCellView.swift
//  FinanceApp
//
//  Created by Arthur Monteiro on 18/04/22.
//

import Foundation
import UIKit

class ContactCellView: UITableViewCell {
    static let identifier = "ContactCell"
    
    private lazy var contactMainStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()
    
    private lazy var contactDataStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()
    
    private lazy var contactAvatarIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 24
        image.layer.masksToBounds = true
        image.image = UIImage(named: "avatar-placeholder")
        image.tintColor = .systemPurple
        return image
    }()
    
    lazy var contactNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Contact Name"
        return label
    }()
    
    lazy var contactPhoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "+55 (61) 99999-9999"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ContactCellView {
    func setupViews() {
        configureSubviews()
        configureConstraints()
    }
    
    func populateCell(contact: Contact) {
        contactNameLabel.text = contact.name
        contactPhoneLabel.text = contact.phone
    }
    
    func configureSubviews() {
        addSubview(contactMainStack)
        
        contactMainStack.addArrangedSubview(contactAvatarIcon)
        contactMainStack.addArrangedSubview(contactDataStack)
        
        contactDataStack.addArrangedSubview(contactNameLabel)
        contactDataStack.addArrangedSubview(contactPhoneLabel)
    }
    
    func configureConstraints() {
        
        NSLayoutConstraint.activate([
            contactMainStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            contactMainStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            contactMainStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            contactMainStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),

            contactAvatarIcon.widthAnchor.constraint(equalToConstant: 48),
            contactAvatarIcon.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}
