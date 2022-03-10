//
//  ActivityDetailsView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ActivityDetailsView: UIView {
    
    lazy var activityDetailsImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "ProfilePhoto")
        image.center = .zero
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        return image
    }()
    
    lazy var nameActivityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mall"
        label.frame = CGRect(x: 0, y: 0, width: 121, height: 22)
        label.font = UIFont(name: "SFProText-Semibold", size: 17)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var typeActivityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Shopping"
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var valueActivityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$ 200.00"
        label.font = .boldSystemFont(ofSize: 34)
        label.frame = CGRect(x: 0, y: 0, width: 413, height: 41)
        label.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var timeActivityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "8:57 AM"
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textColor =  UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var buttonReport: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Report a issue", for: .normal)
        button.layer.cornerRadius = 14
        button.layer.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1).cgColor
        button.frame = CGRect(x: 0, y: 0, width: 375, height: 56)
        // = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        return button
    }()
    
    init() {

        super.init(frame: .zero)
        
        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = .white
        self.configurateSubView()
        self.configureSubviewsConstraints()
    }
    
    func configurateSubView() {
        self.addSubview(self.activityDetailsImage)
        self.addSubview(self.nameActivityLabel)
        self.addSubview(self.typeActivityLabel)
        self.addSubview(self.valueActivityLabel)
        self.addSubview(self.timeActivityLabel)
        self.addSubview(self.buttonReport)
    }
    
    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
            self.activityDetailsImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 156.0),
            self.activityDetailsImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 122.0),
            self.activityDetailsImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -156.0),
            
            self.nameActivityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 156.0),
            self.nameActivityLabel.topAnchor.constraint(equalTo: activityDetailsImage.bottomAnchor, constant: 8.0),
            self.nameActivityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -156.0),
            
            self.typeActivityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0),
            self.typeActivityLabel.topAnchor.constraint(equalTo: nameActivityLabel.bottomAnchor, constant: 8.0),
            self.typeActivityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0),
            
            self.valueActivityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0),
            self.valueActivityLabel.topAnchor.constraint(equalTo: typeActivityLabel.bottomAnchor, constant: 132.0),
            self.valueActivityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0),
            
            self.timeActivityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0),
            self.timeActivityLabel.topAnchor.constraint(equalTo: valueActivityLabel.bottomAnchor, constant: 8.0),
            self.timeActivityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0),
            
            self.buttonReport.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            self.buttonReport.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -17.5),
            self.buttonReport.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0),
            
        ])
    }
}
