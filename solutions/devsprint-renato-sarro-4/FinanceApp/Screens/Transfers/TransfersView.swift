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
    
    private lazy var valueTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.isHidden = true
        textField.addTarget(self, action: #selector(didUpdateValue), for: .editingChanged)
        
        return textField
    }()
    
    private lazy var contactSelectorView: TransferContactSelectorView = {
        TransferContactSelectorView()
    }()
    
    private lazy var transferButton: UIButton = {
        let button = UIButton.build(buttonStyle: .issueButtonBackground, buttonText: .issueButtonTitle)
        button.setTitle("Transfer", for: .normal)
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: Initialization
    init() {
        super.init(frame: .zero)
        
        setupViews()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        addGestureRecognizer(tap)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: Life cycle
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        valueTextField.becomeFirstResponder()
    }
    
    // MARK: Actions
    @objc private func didTap() {
        valueTextField.isFirstResponder ?
        valueTextField.resignFirstResponder() :
        valueTextField.becomeFirstResponder()
    }
    
    @objc private func didUpdateValue() {
        guard let value = valueTextField.text, !value.isEmpty else {
            valueLabel.text = "R$ 0,00"
            return
        }
        
        valueLabel.text = value.currencyFormat
    }
    
    @objc private func actionButton() {
        print("transfer")
    }
    
    // MARK: ViewConfiguration
    func configViews() {
        backgroundColor = .white
    }
    
    func buildViews() {
        addSubviews([valueTextField, valueLabel, contactSelectorView, transferButton])
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
