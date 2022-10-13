//
//  ActivityCellView.swift
//  FinanceApp
//
//  Created by Cleber Reis on 13/10/22.
//

import UIKit

class ActivityCellView: UITableViewCell {
    
    private lazy var icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "fork.knife.circle.fill")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 24
        image.clipsToBounds = true
        
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Food court"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        
        return label
    }()
    
    private lazy var titleDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$ 1000 - 8:57"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        configViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

extension ActivityCellView: ViewCodable {
    
    func configViews() {
        backgroundColor = .white
    }
    
    func buildHierarchy() {
        contentView.addSubview(icon)
        contentView.addSubview(titleLabel)
        contentView.addSubview(titleDescription)
    }
    
    
    func setupConstraints() {
        let bottomConstraint = icon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        bottomConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            icon.heightAnchor.constraint(equalToConstant: 48),
            icon.widthAnchor.constraint(equalToConstant: 48),
            
            titleLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            titleDescription.topAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleDescription.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            titleDescription.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            bottomConstraint
        ])
    }
}
