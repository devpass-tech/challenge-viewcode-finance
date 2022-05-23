//
//  ActivityDetailsView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ActivityDetailsView: UIView {
    
    private lazy var activityDetailsImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(imageLiteralResourceName: "bag.circle.fill")
        image.tintColor = Color.purple.color
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var titleActivityLabel: UILabel = {
        let label = UILabel()
        label.text = "Mall"
        label.font = UIFont.boldSystemFont(ofSize: ActivityDetailsConstants.mediumFontSize)
        label.textColor = Color.primary.color
        label.textAlignment = .center
        return label
    }()
    
    private lazy var typeActivityLabel: UILabel = {
        let label = UILabel()
        label.text = "Shopping"
        label.font = .systemFont(ofSize: 15.0)
        label.textColor = Color.lightGray2.color
        label.textAlignment = .center
        return label
    }()
    
    private lazy var priceActivityLabel: UILabel = {
        let label = UILabel()
        label.text = "$100.00"
        label.font = .boldSystemFont(ofSize: 34)
        label.textColor = Color.primary.color
        label.textAlignment = .center
        return label
    }()
    
    private lazy var timeActivityLabel: UILabel = {
        let label = UILabel()
        label.text = "8:57 AM"
        label.font = .systemFont(ofSize: 15.0)
        label.textColor = Color.lightGray2.color
        label.textAlignment = .center
        return label
    }()
    
    private lazy var reportButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 14
        button.layer.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1).cgColor
        button.setTitle("Report a issue", for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        configViews()
        buildViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews() {
        backgroundColor = .white
    }
    
    func buildViews() {
        [activityDetailsImage, titleActivityLabel, typeActivityLabel, priceActivityLabel, timeActivityLabel, reportButton].forEach(addSubview)
    }
    
    func setupConstraints() {
            
        [activityDetailsImage, titleActivityLabel, typeActivityLabel, priceActivityLabel, timeActivityLabel, reportButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            activityDetailsImage.topAnchor.constraint(equalTo: topAnchor, constant: 94),
            activityDetailsImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityDetailsImage.heightAnchor.constraint(equalToConstant: 100.0),
            activityDetailsImage.widthAnchor.constraint(equalToConstant: 100.0),
            
            titleActivityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 156.0),
            titleActivityLabel.topAnchor.constraint(equalTo: activityDetailsImage.bottomAnchor, constant: 8.0),
            titleActivityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -156.0),
            
            typeActivityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            typeActivityLabel.topAnchor.constraint(equalTo: titleActivityLabel.bottomAnchor, constant: 8.0),
            typeActivityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0),
            
            priceActivityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            priceActivityLabel.topAnchor.constraint(equalTo: typeActivityLabel.bottomAnchor, constant: 192.0),
            priceActivityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0),
            
            timeActivityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            timeActivityLabel.topAnchor.constraint(equalTo: priceActivityLabel.bottomAnchor, constant: 8.0),
            timeActivityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0),
            
            reportButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            reportButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100.5),
            reportButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            reportButton.heightAnchor.constraint(equalToConstant: 56.0)
        ])
    }
}
