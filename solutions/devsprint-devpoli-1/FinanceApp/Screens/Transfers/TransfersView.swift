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
        textField.attributedPlaceholder = NSAttributedString(
            string: "$0",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        textField.font = UIFont.boldSystemFont(ofSize: 34)
        textField.borderStyle = .none
        textField.keyboardType = .asciiCapableNumberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "To"
        label.textColor = .lightGray
        label.font = UIFont(name: "Helvetica-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contactLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose contact"
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contactView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexaString: "#E5E5EA")
        view.layer.cornerRadius = 19
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var statusImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "statusImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var transferButton: UIButton = {
        let button = UIButton()
        button.setTitle("Transfer", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupViews()
        configureTextField()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TransfersView {
    func configureTextField() {
        self.transferTextField.addTarget(self, action: #selector(textFieldDidChange(_:)),
                                    for: .editingChanged)
        self.transferTextField.addTarget(self, action: #selector(myTargetFunction), for: .touchDown)
    }
    
    @objc func myTargetFunction(textField: UITextField) {
        if textField.text == "" {
            self.transferTextField.text = "$\(textField.text!)"
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text == "" {
            self.transferTextField.text = "$\(textField.text!)"
        }
    }
    
    func setupViews() {
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        self.addSubview(self.transferTextField)
        self.addSubview(self.contactView)
        self.contactView.addSubview(contactLabel)
        self.contactView.addSubview(statusImage)
        self.addSubview(self.label)
        self.addSubview(self.transferButton)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            transferTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            transferTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contactView.topAnchor.constraint(equalTo: transferTextField.bottomAnchor, constant: 10),
            contactView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            contactView.heightAnchor.constraint(equalToConstant: 38),
            contactView.widthAnchor.constraint(equalToConstant: 157)
        ])
        
        NSLayoutConstraint.activate([
            contactLabel.centerYAnchor.constraint(equalTo: contactView.centerYAnchor),
            contactLabel.leftAnchor.constraint(equalTo: contactView.leftAnchor, constant: 30)
        ])
        
        
        NSLayoutConstraint.activate([
            statusImage.leftAnchor.constraint(equalTo: contactView.leftAnchor, constant: 10),
            statusImage.centerYAnchor.constraint(equalTo: contactView.centerYAnchor),
            statusImage.heightAnchor.constraint(equalToConstant: 13),
            statusImage.widthAnchor.constraint(equalToConstant: 13)
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: transferTextField.bottomAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: contactView.leadingAnchor, constant: -13),
            label.centerYAnchor.constraint(equalTo: contactView.centerYAnchor, constant: 0)
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

extension UIColor {
    convenience init(hexaString: String, alpha: CGFloat = 1) {
        let chars = Array(hexaString.dropFirst())
        self.init(red:   .init(strtoul(String(chars[0...1]),nil,16))/255,
                  green: .init(strtoul(String(chars[2...3]),nil,16))/255,
                  blue:  .init(strtoul(String(chars[4...5]),nil,16))/255,
                  alpha: alpha)}
}
