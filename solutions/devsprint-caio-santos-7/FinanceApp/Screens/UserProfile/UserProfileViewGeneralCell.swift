//
//  UserProfileViewGeneralCell.swift
//  FinanceApp
//
//  Created by Vinicius on 21/10/22.
//

import UIKit

class UserProfileViewGeneralCell: UITableViewCell {
    
    static let identifier = "UserProfileViewGeneralCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        configViews()
        buildHierarchy()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private lazy var generalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Personal data"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var detailButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .lightGray
        button.layer.cornerRadius = 15
        return button
    }()

}

extension UserProfileViewGeneralCell: ViewCodable {
    
    public func configure(generalLabel: String) {
        self.generalLabel.text = generalLabel
        self.detailButton = detailButton
    }
    
    func configViews() {
        backgroundColor = .white
    }
    
    func buildHierarchy() {
        contentView.addSubview(generalLabel)
        contentView.addSubview(detailButton)
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            generalLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            generalLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            generalLabel.heightAnchor.constraint(equalToConstant: 48),
//            generalLabel.widthAnchor.constraint(equalToConstant: 48),
            
            detailButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            detailButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            detailButton.heightAnchor.constraint(equalToConstant: 48),
            detailButton.widthAnchor.constraint(equalToConstant: 48)
        ])
    }
}
