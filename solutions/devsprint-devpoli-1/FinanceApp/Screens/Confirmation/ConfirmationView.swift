//
//  ConfirmationView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ConfirmationView: UIView {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "checkmark.circle.fill")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = UIColor.green
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Your transfer was successfull"
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
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(onClick), for: .touchDown)
        button.addTarget(self, action: #selector(onClickEnd), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc
    private func onClick() {
        button.backgroundColor = UIColor.systemGray
    }
    
    @objc
    private func onClickEnd() {
        button.backgroundColor = UIColor.systemBlue
    }
    
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
        let constraint = [
            imageView.heightAnchor.constraint(equalToConstant: CGFloat(89)),
            imageView.widthAnchor.constraint(equalToConstant: CGFloat(106)),
            imageView.centerXAnchor.constraint(equalTo: label.centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -10)
        ]
        
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func labelConstraints() {
        let constraint = [
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        
        constraint.forEach { item in
            item.isActive = true
        }
    }
    
    private func buttonConstraints() {
        button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
    }
}
