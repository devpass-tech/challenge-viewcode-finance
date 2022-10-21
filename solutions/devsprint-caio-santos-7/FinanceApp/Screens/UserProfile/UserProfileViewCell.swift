//
//  UserProfileViewCell.swift
//  FinanceApp
//
//  Created by Vinicius on 20/10/22.
//

import UIKit

class UserProfileViewCell: UITableViewCell {
    
    static let identifier = "UserProfileViewCell"
    
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
    
    private lazy var leftLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Phone"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var rightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "teste"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        
        return label
    }()


}

extension UserProfileViewCell: ViewCodable {
    
    public func configure(leftLabel: String, rightLabel: String) {
        self.leftLabel.text = leftLabel
        self.rightLabel.text = rightLabel
    }
    
    
    func configViews() {
        backgroundColor = .white
    }
    
    func buildHierarchy() {
        contentView.addSubview(leftLabel)
        contentView.addSubview(rightLabel)
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            leftLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            leftLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            leftLabel.heightAnchor.constraint(equalToConstant: 48),
//            leftLabel.widthAnchor.constraint(equalToConstant: 48),
            
            rightLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            rightLabel.heightAnchor.constraint(equalToConstant: 48),
//            rightLabel.widthAnchor.constraint(equalToConstant: 48)
        ])
    }
}
