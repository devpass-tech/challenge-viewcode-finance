//
//  ActivityListTableViewCell.swift
//  FinanceApp
//
//  Created by Tatiana Rico on 14/06/22.
//

import UIKit

class ActivityListTableViewCell: UITableViewCell {
    static var reuseId: String = "ActivityListTableViewCell"
    
    private var categoryIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.frame.size = CGSize(width: 48, height: 48)
        return image
    }()
    
    private var arrowIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrow")
        image.frame.size = CGSize(width: 20, height: 20)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var storeLb: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private var valueLb: UILabel = {
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

    func setupViews(model: Activity) {
        configViews()
        getIcon(model: model)
        storeLb.text = model.name
        valueLb.text = String.activityDetails(with: model.price, and: model.time)
    }
}

extension ActivityListTableViewCell: ViewConfiguration {
    func configViews() {
        buildViews()
        setupConstraints()
    }
    
    func buildViews() {
        self.addSubview(stackView)
        self.addSubview(categoryIcon)
        self.addSubview(arrowIcon)
        self.stackView.addArrangedSubview(storeLb)
        self.stackView.addArrangedSubview(valueLb)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.categoryIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.categoryIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            self.categoryIcon.heightAnchor.constraint(equalToConstant: 48),
            self.categoryIcon.widthAnchor.constraint(equalToConstant: 48),
            
            self.stackView.leftAnchor.constraint(equalTo: categoryIcon.rightAnchor, constant: 10),
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),

            self.arrowIcon.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            self.arrowIcon.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            self.arrowIcon.heightAnchor.constraint(equalToConstant: 10),
            self.arrowIcon.widthAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    func getIcon(model: Activity) {
        if model.name == "Mall" {
            categoryIcon.image = UIImage(imageLiteralResourceName: "bag.circle.fill")
        } else if model.name == "Food Court" {
            categoryIcon.image = UIImage(imageLiteralResourceName: "fork.knife.circle.fill")
        } else if model.name == "Oceanic Airlines" {
            categoryIcon.image = UIImage(imageLiteralResourceName: "airplane.circle.fill")
        } else if model.name == "Gym Membership" {
            categoryIcon.image = UIImage(imageLiteralResourceName: "heart.circle.fill")
        } else if model.name == "Private Transport" {
            categoryIcon.image = UIImage(imageLiteralResourceName: "car.circle.fill")
        }
    }
}
