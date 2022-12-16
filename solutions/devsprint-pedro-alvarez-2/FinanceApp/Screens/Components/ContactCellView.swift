//
//  ContactCellView.swift
//  FinanceApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import UIKit

class ContactCellView: UITableViewCell {
    

    static let identifier = "ContactCellView"
    
    private let contactCell: ContactListView = {
        let contactCell = ContactListView()
        contactCell.translatesAutoresizingMaskIntoConstraints = false
        return contactCell
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            backgroundColor = .clear
            confighierarchy()
            configConstraints()
        }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with contactList: ContactListModel) {
        contactCell.getPopularView(image: contactList.image, name: contactList.name, phone: contactList.phone)
    }
    
}

extension ContactCellView {
    private func confighierarchy() {
        addSubview(contactCell)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            contactCell.topAnchor.constraint(equalTo: self.topAnchor),
            contactCell.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contactCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            contactCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
}

