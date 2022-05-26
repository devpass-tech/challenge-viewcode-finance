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
        button.layer.backgroundColor = Color.blue.color.cgColor
        button.setTitle("Report a issue", for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        configViews()
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews() {
        backgroundColor = .white
    }
    
    func buildViewHierarchy() {
        addSubview(activityDetailsImage)
        addSubview(titleActivityLabel)
        addSubview(typeActivityLabel)
        addSubview(priceActivityLabel)
        addSubview(timeActivityLabel)
        addSubview(reportButton)
    }
    
    func setupConstraints() {
        [activityDetailsImage, titleActivityLabel, typeActivityLabel, priceActivityLabel, timeActivityLabel, reportButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            activityDetailsImage.topAnchor.constraint(equalTo: topAnchor, constant: 34),
            activityDetailsImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityDetailsImage.heightAnchor.constraint(equalToConstant: 100),
            activityDetailsImage.widthAnchor.constraint(equalToConstant: 100),
            
            titleActivityLabel.topAnchor.constraint(equalTo: activityDetailsImage.bottomAnchor, constant: 8),
            titleActivityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            typeActivityLabel.topAnchor.constraint(equalTo: titleActivityLabel.bottomAnchor, constant: 8),
            typeActivityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            priceActivityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            priceActivityLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            timeActivityLabel.topAnchor.constraint(equalTo: priceActivityLabel.bottomAnchor, constant: 8),
            timeActivityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            reportButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            reportButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            reportButton.heightAnchor.constraint(equalToConstant: 56),
            reportButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -17)
        ])
    }
}
