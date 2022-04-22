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
        stack.axis = .horizontal
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
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        image.image = UIImage(named: "bag.circle.fill")
        image.tintColor = .systemPurple
        return image
    }()
    
    private lazy var activityNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Mall"
        label.tintColor = .black
        return label
    }()
    
    private lazy var activityDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
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

private extension ActivityCellView {
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
            activityMainStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            activityMainStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
            activityMainStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            activityMainStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),

            activityCategoryIcon.widthAnchor.constraint(equalToConstant: 48),
            activityCategoryIcon.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}

extension ActivityCellView {
    
    // MARK: Populate Cell
    
    func setupActivity(activity: Activity) {
        setupActivityCategoryIcon(activityName: activity.name)
        setupActivityDescription(activity: activity)
    }
    
    func setupActivityCategoryIcon(activityName: String) {
        switch activityName {
        case _ where activityName.contains("Mall"):
            activityCategoryIcon.image =  UIImage(named: "bag.circle.fill")
            activityCategoryIcon.tintColor = .systemPurple
        case _ where activityName.contains("Food"):
            activityCategoryIcon.image =  UIImage(named: "fork.knife.circle.fill")
            activityCategoryIcon.tintColor = .systemBlue
        case _ where activityName.contains("Airlines"):
            activityCategoryIcon.image =  UIImage(named: "airplane.circle.fill")
            activityCategoryIcon.tintColor = .systemOrange
        case _ where activityName.contains("Gym"):
            activityCategoryIcon.image =  UIImage(named: "heart.circle.fill")
            activityCategoryIcon.tintColor = .systemRed
        case _ where activityName.contains("Transport"):
            activityCategoryIcon.image =  UIImage(named: "car.circle.fill")
            activityCategoryIcon.tintColor = .systemGreen
        default:
            activityCategoryIcon.image =  UIImage(named: "bag.circle.fill")
            activityCategoryIcon.tintColor = .gray
        }
    }
    
    func setupActivityDescription(activity: Activity) {
        activityNameLabel.text = activity.name
        activityDescriptionLabel.text = String.activityDetails(with: activity.price, and: activity.time)
    }
}
