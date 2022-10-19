//
//  ActivityCellView.swift
//  FinanceApp
//
//  Created by Cleber Reis on 13/10/22.
//

import UIKit

enum ActivityTypes: String {
    case mall = "Mall"
    case foodCourt = "Food Court"
    case oceanicAirlines = "Oceanic Airlines"
    
    func getColor() -> UIColor {
        switch self {
        case .mall:
            return UIColor(red: 190/255, green: 81/255, blue: 255/255, alpha: 1)
        case .foodCourt:
            return .blue
        case .oceanicAirlines:
            return .orange
        }
    }
    
    func getIcon() -> UIImage? {
        switch self {
        case .mall:
            return UIImage(named: "bag.circle.fill")
        case .foodCourt:
            return UIImage(named: "fork.knife.circle.fill")
        case .oceanicAirlines:
            return UIImage(named: "airplane.circle.fill")
        }
    }
}

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
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 4
        
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Food court"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
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
    
    // MARK: Public Methods
    func updateValues(activity: Activity) {
        titleLabel.text = activity.name
        
        if let type = ActivityTypes(rawValue: activity.name) {
            icon.tintColor = type.getColor()
            icon.image = type.getIcon()
        }

        titleDescription.text = String.activityDetails(with: activity.price, and: activity.time)
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
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(titleDescription)
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            icon.heightAnchor.constraint(equalToConstant: 48),
            icon.widthAnchor.constraint(equalToConstant: 48),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
}
