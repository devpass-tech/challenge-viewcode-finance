//
//  ContactListView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ContactListTableViewCell: UITableViewCell {
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
    private lazy var container: UIStackView = {
        let element = UIStackView(frame: .zero)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        element.alignment = .center
        element.distribution = .fill
        element.spacing = 16
        
        return element
    }()
    
    private lazy var userImage: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "avatar-placeholder")
        element.tintColor = .blue
        element.layer.cornerRadius = 25
        element.layer.masksToBounds = true
        
        return element
    }()
    
    private lazy var labelStackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .leading
        element.distribution = .fill
        element.spacing = 4
        
        return element
    }()
    
    private lazy var nameLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Name"
        element.font = UIFont.boldSystemFont(ofSize: 16)
        
        return element
    }()
    
    private lazy var phoneNumberLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "+55 11 99999-9999"
        element.textColor = .lightGray
        
        return element
    }()
}

    //MARK: - ViewCodable
extension ContactListTableViewCell: ViewCodable {

    func buildHierarchy() {
        addSubview(container)
        container.addArrangedSubview(userImage)
        container.addArrangedSubview(labelStackView)
        labelStackView.addArrangedSubview(nameLabel)
        labelStackView.addArrangedSubview(phoneNumberLabel)
    }

    func setupConstraints() {
        
        let userImageSize: CGFloat = 50
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            userImage.heightAnchor.constraint(equalToConstant: userImageSize),
            userImage.widthAnchor.constraint(equalToConstant: userImageSize)
        ])
    }

}
