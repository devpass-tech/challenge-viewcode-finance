//
//  ConfirmationView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ConfirmationView: UIView {
    
    private lazy var imageView: UIImageView = {
        let checkmarkImage = UIImageView()
        let image = UIImage(named: "checkmark.circle.fill")
        checkmarkImage.image = image
        checkmarkImage.tintColor = UIColor.systemGreen
        checkmarkImage.translatesAutoresizingMaskIntoConstraints = false
        return checkmarkImage
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Your transfer was successful"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Nice", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 14
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubviews()
        imageViewConstraints()
        labelConstraints()
        buttonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(imageView)
        addSubview(label)
        addSubview(button)
    }
    
    private func imageViewConstraints() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: CGFloat(89)),
            imageView.widthAnchor.constraint(equalToConstant: CGFloat(106)),
            imageView.centerXAnchor.constraint(equalTo: label.centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -10)
        ])
    }
    
    private func labelConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func buttonConstraints() {
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            button.heightAnchor.constraint(equalToConstant: 56),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
        ])
    }
}
