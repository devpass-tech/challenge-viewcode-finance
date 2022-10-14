//
//  ContactListView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ContactCellView: UITableViewCell {
   static let identifier = "ContactCellIdentifier"
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
        setupView()
    }

    required init?(coder: NSCoder) {
        return nil
    }
    
    //MARK: - Visual Components
    lazy var container: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        element.alignment = .center
        
        return element
    }()
}

    //MARK: - ViewCodable
extension ContactCellView: ViewCodable {

    func buildHierarchy() {
        addSubview(container)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
}
