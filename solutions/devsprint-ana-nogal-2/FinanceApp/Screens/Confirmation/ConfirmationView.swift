//
//  ConfirmationView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ConfirmationView: UIView {

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 106, height: 89))
        imageView.image = UIImage(named: "checkmark.circle.fill")
        imageView.tintColor = UIColor(red: 0.196, green: 0.843, blue: 0.294, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Your transfer was successful"
        descriptionLabel.font = .systemFont(ofSize: 17, weight: .bold)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return descriptionLabel
    }()
    
    private lazy var confirmationButton: UIButton = {
        let confirmationButton = UIButton()
        confirmationButton.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        confirmationButton.setTitle("Nice", for: .normal)
        confirmationButton.layer.cornerRadius = 14
        confirmationButton.translatesAutoresizingMaskIntoConstraints = false
        
        return confirmationButton
    }()
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Customize User Interface

extension ConfirmationView {
    private func configure() {
        backgroundColor = .white
        configureSubviews()
        configureSubviewConstraints()
    }
    
    private func configureSubviews() {
        self.addSubview(stackView)
        self.stackView.addArrangedSubview(imageView)
        self.stackView.addArrangedSubview(descriptionLabel)
        self.addSubview(confirmationButton)
    }
    
    private func configureSubviewConstraints() {
        NSLayoutConstraint.activate([
            self.stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.confirmationButton.heightAnchor.constraint(equalToConstant: 57),
            self.confirmationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.confirmationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.confirmationButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}

#if DEBUG

import SwiftUI

struct ConfirmationView_Preview: PreviewProvider {
    static var previews: some View {
        return SwiftUIPreView { _ in
            let view = ConfirmationView()
            
            return view
        }
    }
}

#endif
