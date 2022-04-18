//
//  TransfersView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class TransfersView: UIView {
    private lazy var transferTextField: UITextField = {
       let textField = UITextField()
        textField.text = "$0"
        textField.font = UIFont.boldSystemFont(ofSize: 30)
        textField.borderStyle = .none
        textField.keyboardType = .asciiCapableNumberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var transferButton: UIButton = {
        let button = UIButton()
        button.setTitle("Transfer", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
private extension TransfersView {
    
    func setupViews() {
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        self.addSubview(self.transferTextField)
        self.addSubview(self.transferButton)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            transferTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            transferTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            transferButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            transferButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            transferButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            transferButton.heightAnchor.constraint(equalToConstant: 60),
            transferButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
