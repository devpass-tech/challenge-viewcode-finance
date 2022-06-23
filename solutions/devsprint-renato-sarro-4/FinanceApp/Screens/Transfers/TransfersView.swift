//
//  TransfersView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class TransfersView: UIView, ViewConfiguration {
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel.build(style: .largeTitle, adColor: .secondary)
        label.textAlignment = .center
        label.text = "R$ 0,00"
        
        return label
    }()
    
    private lazy var contactSelectorView: TransferContactSelectorView = {
        TransferContactSelectorView()
    }()
    
    lazy var transferButton: UIButton = {
        let button = UIButton.build(buttonStyle: .issueButtonBackground, buttonText: .issueButtonTitle)
        button.setTitle("Transfer", for: .normal)
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: Initialization
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: Actions
    @objc private func actionButton() {
        print("transfer")
    }
    
    // MARK: ViewConfiguration
    func configViews() {
        backgroundColor = .white
    }
    
    func buildViews() {
        addSubviews([valueLabel, contactSelectorView, transferButton])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            valueLabel.bottomAnchor.constraint(equalTo: contactSelectorView.topAnchor, constant: -14),
            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            contactSelectorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            contactSelectorView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            transferButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -17),
            transferButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            transferButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
