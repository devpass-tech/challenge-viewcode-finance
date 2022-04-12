//
//  ActivityCellView.swift
//  FinanceApp
//
//  Created by Vinicius Rocha on 12/04/22.
//

import UIKit

class ActivityCellView: UITableViewCell {
    
    static let identifier = "ActivityCell"
    
    // MARK: Declare Views
    
    private lazy var activityMainStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()
    
    private lazy var activityDescriptionStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()
    
    private lazy var activityCategoryIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 24
        image.layer.masksToBounds = true
        image.image = UIImage(named: "bag.circle.fill")
        image.tintColor = .systemPurple
        return image
    }()
    
    lazy var activityNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Mall"
        return label
    }()
    
    lazy var activityDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "$100.00 • 8:57 AM"
        return label
    }()
    
    // MARK: Init Settings
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ActivityCellView {
    
    // MARK: View and Constraint Settings
    
    func setupViews() {
        configureSubviews()
        configureConstraints()
    }
    
    func configureSubviews() {
        addSubview(activityMainStack)
        
        activityMainStack.addArrangedSubview(activityCategoryIcon)
        activityMainStack.addArrangedSubview(activityDescriptionStack)
        
        activityDescriptionStack.addArrangedSubview(activityNameLabel)
        activityDescriptionStack.addArrangedSubview(activityDescriptionLabel)
    }
    
    func configureConstraints() {
        
        NSLayoutConstraint.activate([
            activityMainStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            activityMainStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            activityMainStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            activityMainStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),

            activityCategoryIcon.widthAnchor.constraint(equalToConstant: 48),
            activityCategoryIcon.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}
