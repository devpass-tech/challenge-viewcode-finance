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
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel.build(with: .bigTitle(color: .lightGray), alignment: .center)
        label.text = "R$ 0,00"
        return label
    }()

    private lazy var amountTextField: UITextField = {
        let textField = UITextField()
        textField.isHidden = true
        textField.addTarget(self, action: #selector(updateAmountLabelIfNeeded), for: .editingChanged)
        textField.keyboardType = .numberPad
        return textField
    }()

    private lazy var chooseContactButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(chooseContact), for: .touchUpInside)
        return button
    }()
    
    private lazy var chooseContactRoundDetail: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Color.lightGreen.color
        view.layer.cornerRadius = 6
        return view
    }()
    
    private lazy var chooseContactButtonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose contact"
        label.textColor = .black
        label.font = UIFont(name: "SFProText-Semibold", size: 13)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var chooseContactView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Color.lightGray.color
        view.layer.cornerRadius = 19
        return view
    }()
    
    private lazy var chooseContactLeftLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "To"
        label.textColor = Color.lightGray2.color
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var transferButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Transfer", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(transfer), for: .touchUpInside)
        return button
    }()
    
    private lazy var selectContactView: UIView = {
        return makeChooseContactView()
    }()
    
    private var bottomConstraint: NSLayoutConstraint?
    
    // MARK: Init
    init() {
        super.init(frame: .zero)
        self.setupViews()
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { notification in
            self.keyboardWillShow(notification: notification)
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { notification in
            self.keyboardWillHide()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        amountTextField.becomeFirstResponder()
    }
    
    private func keyboardWillHide() {
        bottomConstraint?.constant = -16
        layoutIfNeeded()
    }
    
    private func keyboardWillShow(notification: Notification) {
        guard let size = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size else { return }
        
        bottomConstraint?.constant = -size.height
        layoutIfNeeded()
    }
    
    @objc private func updateAmountLabelIfNeeded() {
        guard let amountText = amountTextField.text, !amountText.isEmpty else {
            amountLabel.text = "R$ 0,00"
            amountLabel.textColor = Color.lightGray.color
            
            return
        }
        
        amountLabel.text = amountTextField.text?.currencyInputFormatting
        amountLabel.textColor = Color.primary.color
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
        
    }
    
    func buildViews() {
        stackView.addArrangedSubviews([amountLabel, selectContactView])
        addSubviews([amountTextField, stackView, transferButton])
    }
    
    func setupConstraints() {
        bottomConstraint = transferButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        bottomConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),

            transferButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            transferButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            transferButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
