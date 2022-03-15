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
        textField.keyboardType = .numberPad
        return textField
    }()

    private let chooseContactButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(chooseContact), for: .touchUpInside)
        return button
    }()
    
    private let chooseContactRoundDetail: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
        view.layer.cornerRadius = 6
        return view
    }()
    
    private let chooseContactButtonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose contact"
        label.textColor = .black
        label.font = UIFont(name: "SFProText-Semibold", size: 13)
        label.textAlignment = .center
        return label
    }()
    
    private let chooseContactView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.918, alpha: 1)
        view.layer.cornerRadius = 19
        return view
    }()
    
    private let chooseContactLeftLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "To"
        label.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textAlignment = .center
        return label
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
    
    // MARK: Methods
    private func makeChooseContactView() -> UIView {
        let view = UIView()
        view.backgroundColor = .clear

        view.addSubview(chooseContactLeftLabel)
        view.addSubview(chooseContactView)
        chooseContactView.addSubview(chooseContactButton)
        chooseContactView.addSubview(chooseContactRoundDetail)
        chooseContactView.addSubview(chooseContactButtonLabel)
        
        NSLayoutConstraint.activate([
            chooseContactLeftLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chooseContactLeftLabel.trailingAnchor.constraint(equalTo: chooseContactView.leadingAnchor, constant: -13),
            chooseContactLeftLabel.centerYAnchor.constraint(equalTo: chooseContactView.centerYAnchor),
            chooseContactLeftLabel.widthAnchor.constraint(equalToConstant: 20),
            chooseContactLeftLabel.heightAnchor.constraint(equalToConstant: 20),
            
            chooseContactButtonLabel.centerYAnchor.constraint(equalTo: chooseContactView.centerYAnchor),
            chooseContactButtonLabel.trailingAnchor.constraint(equalTo: chooseContactView.trailingAnchor, constant: -10),
            
            chooseContactRoundDetail.leadingAnchor.constraint(equalTo: chooseContactView.leadingAnchor, constant: 10),
            chooseContactRoundDetail.trailingAnchor.constraint(equalTo: chooseContactButtonLabel.leadingAnchor, constant: -2),
            chooseContactRoundDetail.centerYAnchor.constraint(equalTo: chooseContactView.centerYAnchor),
            chooseContactRoundDetail.widthAnchor.constraint(equalToConstant: 12),
            chooseContactRoundDetail.heightAnchor.constraint(equalToConstant: 12),

            chooseContactButton.centerXAnchor.constraint(equalTo: chooseContactView.centerXAnchor),
            chooseContactButton.centerYAnchor.constraint(equalTo: chooseContactView.centerYAnchor),
            chooseContactButton.widthAnchor.constraint(equalTo: chooseContactView.widthAnchor),
            chooseContactButton.heightAnchor.constraint(equalTo: chooseContactView.heightAnchor),
            
            chooseContactView.topAnchor.constraint(equalTo: view.topAnchor),
            chooseContactView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chooseContactView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            chooseContactView.heightAnchor.constraint(equalToConstant: 38),
            chooseContactView.widthAnchor.constraint(equalToConstant: 157)
        ])
        
        return view
    }
    
    // MARK: Actions
    @objc
    private func chooseContact() {
        self.didPressChooseContactButton?()
    }

    @objc
    private func transfer() {
        self.didPressTransferButton?()
    }
}

// MARK: Extension
extension TransfersView: ViewConfiguration {
    func configViews() {
        stackView.addArrangedSubview(amountTextField)
        stackView.addArrangedSubview(self.makeChooseContactView())
    }
    
    func buildViews() {
        addSubview(stackView)
        addSubview(transferButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: readableContentGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: readableContentGuide.centerYAnchor),

            transferButton.bottomAnchor.constraint(equalTo: readableContentGuide.bottomAnchor, constant: -17.5),
            transferButton.leadingAnchor.constraint(equalTo: readableContentGuide.leadingAnchor, constant: 20),
            transferButton.trailingAnchor.constraint(equalTo: readableContentGuide.trailingAnchor, constant: -20),
            transferButton.heightAnchor.constraint(equalToConstant: 56)
        ])

    }
    
    
}
