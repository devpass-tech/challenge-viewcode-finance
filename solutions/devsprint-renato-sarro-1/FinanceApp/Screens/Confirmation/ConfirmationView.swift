//
//  ConfirmationView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ConfirmationView: UIView, ViewConfiguration {

    lazy var imageConfirmation: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(imageLiteralResourceName: "checkmark.circle.fill")
            image.tintColor = UIColor(red: 0.196, green: 0.843, blue: 0.294, alpha: 1)
            image.translatesAutoresizingMaskIntoConstraints = false
            
            return image
        }()
        
        lazy var titleConfirmation: UILabel = {
            let label = UILabel()
            label.text = "Your transfer was successful"
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 17, weight: .bold)
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        
        lazy var buttonConfirmation: UIButton = {
            let button = UIButton()
            button.setTitle("Nice", for: .normal)
            button.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
            button.layer.cornerRadius = 14
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
        }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: View Configuration
    func configViews() {
        backgroundColor = .white
    }
    
    func buildViews() {
        [imageConfirmation, titleConfirmation, buttonConfirmation].forEach(addSubview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageConfirmation.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageConfirmation.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageConfirmation.heightAnchor.constraint(equalToConstant: 89),
            imageConfirmation.widthAnchor.constraint(equalToConstant: 89),
            
            titleConfirmation.topAnchor.constraint(equalTo: imageConfirmation.bottomAnchor, constant: 8),
            titleConfirmation.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            buttonConfirmation.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -34),
            buttonConfirmation.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            buttonConfirmation.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            buttonConfirmation.heightAnchor.constraint(equalToConstant: 56)
        ])
        
    }
}
