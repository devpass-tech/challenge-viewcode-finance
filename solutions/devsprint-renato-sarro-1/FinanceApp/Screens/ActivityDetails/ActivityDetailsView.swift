//
//  ActivityDetailsView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ActivityDetailsView: UIView, ViewConfiguration {

    private lazy var activityDetailsImage: UIImageView = {
        let image = UIImageView()
        image.image                 = UIImage(imageLiteralResourceName: "bag.circle.fill")
        image.tintColor             = .systemPurple
        image.contentMode           = .scaleAspectFit
        image.clipsToBounds         = true
        image.layer.masksToBounds   = true
        
        return image
    }()
    
    private lazy var nameActivityLabel: UILabel = {
        let label = UILabel()
        label.text              = "Mall"
        label.font              = UIFont.boldSystemFont(ofSize: ActivityDetailsConstants.mediumFontSize)
        label.textColor         = .black
        label.textAlignment     = .center
        
        return label
    }()
    
    private lazy var typeActivityLabel: UILabel = {
        let label           = UILabel()
        label.text          = "Shopping"
        label.font          = .systemFont(ofSize: 15.0)
        label.textColor     = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var valueActivityLabel: UILabel = {
        let label           = UILabel()
        label.text          = "$100.00"
        label.font          = .boldSystemFont(ofSize: 34)
        label.textColor     =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var timeActivityLabel: UILabel = {
        let label               = UILabel()
        label.text              = "8:57 AM"
        label.font              = .systemFont(ofSize: 15.0)
        label.textColor         = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        label.textAlignment     = .center
        
        return label
    }()
    
    private lazy var buttonReport: UIButton = {
        let button                      = UIButton()
        button.layer.cornerRadius       = 14
        button.layer.backgroundColor    = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1).cgColor
        button.setTitle("Report a issue", for: .normal)
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews() {
        backgroundColor = .white
    }
    
    func buildViews() {
        [activityDetailsImage, nameActivityLabel, typeActivityLabel, valueActivityLabel, timeActivityLabel, buttonReport].forEach(addSubview)
    }
    
    func setupConstraints() {
            
        [activityDetailsImage, nameActivityLabel, typeActivityLabel, valueActivityLabel, timeActivityLabel, buttonReport].forEach { $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            activityDetailsImage.topAnchor.constraint(equalTo: topAnchor, constant: 34),
            activityDetailsImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityDetailsImage.heightAnchor.constraint(equalToConstant: 100.0),
            activityDetailsImage.widthAnchor.constraint(equalToConstant: 100.0),
            
            nameActivityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 156.0),
            nameActivityLabel.topAnchor.constraint(equalTo: activityDetailsImage.bottomAnchor, constant: 8.0),
            nameActivityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -156.0),
            
            typeActivityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            typeActivityLabel.topAnchor.constraint(equalTo: nameActivityLabel.bottomAnchor, constant: 8.0),
            typeActivityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0),
            
            valueActivityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            valueActivityLabel.topAnchor.constraint(equalTo: typeActivityLabel.bottomAnchor, constant: 132.0),
            valueActivityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0),
            
            timeActivityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            timeActivityLabel.topAnchor.constraint(equalTo: valueActivityLabel.bottomAnchor, constant: 8.0),
            timeActivityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0),
            
            buttonReport.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            buttonReport.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17.5),
            buttonReport.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            buttonReport.heightAnchor.constraint(equalToConstant: 56.0)
        ])
    }
}
