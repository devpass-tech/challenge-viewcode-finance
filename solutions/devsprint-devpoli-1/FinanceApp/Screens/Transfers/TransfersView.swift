//
//  TransfersView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class TransfersView: UIView {
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
        self.addSubview(self.transferButton)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            transferButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            transferButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            transferButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            transferButton.heightAnchor.constraint(equalToConstant: 60),
            transferButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
