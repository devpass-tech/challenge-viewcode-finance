//
//  TransfersView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class TransfersView: UIView {
    // MARK: Properties
    var didPressChooseContactButton: (() -> Void)?
    var didPressTransferButton: (() -> Void)?
    
    // MARK: UI Components
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    private let amountTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "$0"
        textField.font = UIFont.boldSystemFont(ofSize: 34)
        textField.textAlignment = .center
        textField.keyboardType = .numbersAndPunctuation
        return textField
    }()

    private let chooseContactButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Choose contact", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(chooseContact), for: .touchUpInside)
        return button
    }()

    private let transferButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Transfer", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(transfer), for: .touchUpInside)
        return button
    }()
    
    // MARK: Init
    init() {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    @objc
    private func chooseContact() {
        didPressChooseContactButton?()
    }

    @objc
    private func transfer() {
        didPressTransferButton?()
    }
}

// MARK: Extension
extension TransfersView: ViewConfiguration {
    func configViews() {
        stackView.addArrangedSubview(amountTextField)
        stackView.addArrangedSubview(chooseContactButton)
    }
    
    func buildViews() {
        addSubview(stackView)
        addSubview(transferButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),

            transferButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            transferButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            transferButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            transferButton.heightAnchor.constraint(equalToConstant: 56)
        ])

    }
    
    
}
