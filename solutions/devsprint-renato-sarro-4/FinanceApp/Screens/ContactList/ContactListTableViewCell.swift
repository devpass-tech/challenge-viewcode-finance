//
//  ContactListTableViewCell.swift
//  FinanceApp
//
//  Created by Tatiana Rico on 15/06/22.
//

import UIKit

class ContactListTableViewCell: UITableViewCell {
    static var reuseId: String = "ContactListTableViewCell"
    private var categoryIcon: UIImageView = {
        let image = UIImageView()
        image.frame.size = CGSize(width: 48, height: 48)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "avatar-placeholder")
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.layer.cornerRadius = image.frame.size.width/2
        return image
    }()
    
    private var nameLb: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private var phoneLb: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    func setupViews(model: Contact) {
        nameLb.text = model.name
        phoneLb.text = model.phone
        configViews()
    }
}

extension ContactListTableViewCell: ViewConfiguration {
    func configViews() {
        buildViews()
        setupConstraints()
    }
    
    func buildViews() {
        self.contentView.addSubview(stackView)
        self.contentView.addSubview(categoryIcon)
        self.stackView.addArrangedSubview(nameLb)
        self.stackView.addArrangedSubview(phoneLb)
    }
    
    func setupConstraints() {
        let bottomConstrant = self.stackView.bottomAnchor.constraint(equalTo:  self.contentView.bottomAnchor, constant: -20)
        
        bottomConstrant.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            self.categoryIcon.topAnchor.constraint(equalTo:  self.contentView.topAnchor, constant: 20),
            self.categoryIcon.leftAnchor.constraint(equalTo:  self.contentView.leftAnchor, constant: 15),
            self.categoryIcon.heightAnchor.constraint(equalToConstant: 48),
            self.categoryIcon.widthAnchor.constraint(equalToConstant: 48),
            
            self.stackView.leftAnchor.constraint(equalTo: categoryIcon.rightAnchor, constant: 15),
            self.stackView.topAnchor.constraint(equalTo:  self.contentView.topAnchor, constant: 20),
            self.stackView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            bottomConstrant
        ])
    }
}
