//
//  TransfersView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class TransfersView: UIView {
    
    private lazy var stackViewPrincipal: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 10
        sv.axis = .vertical
        sv.distribution = .fill
        return sv
    }()
    
    private lazy var stackViewSec: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.alignment = .center
        sv.spacing = 10
        sv.axis = .horizontal
        return sv
    }()
    
    lazy var centerLabel: UITextField = {
        var input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.keyboardType = .numberPad
        input.font = UIFont.boldSystemFont(ofSize: 40)
        input.attributedPlaceholder = .init(
            string: "$0",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)]
        )
        input.textAlignment = .center
        
        return input
    }()
    
    private lazy var to: UILabel = {
        let to = UILabel()
        to.translatesAutoresizingMaskIntoConstraints = false
        to.text = "To"
        to.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        to.font = UIFont.systemFont(ofSize: 12)
        return to
    }()
    
    lazy var buttonContact: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0.463, green: 0.463, blue: 0.502, alpha: 0.12)
        button.setTitle("Choose contact", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private lazy var iconGreen: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 4
        view.backgroundColor = .green
        return view
    }()
    
    lazy var buttonTransfer: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Transfer", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        self.configSetup()
        self.setUpContraints()
    }
    
    private func configSetup(){
        addSubview(stackViewPrincipal)
        stackViewPrincipal.addArrangedSubview(centerLabel)
        stackViewPrincipal.addArrangedSubview(stackViewSec)
        stackViewSec.addArrangedSubview(to)
        stackViewSec.addArrangedSubview(buttonContact)
        buttonContact.addSubview(iconGreen)
        addSubview(buttonTransfer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpContraints(){
        let lg = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stackViewPrincipal.centerYAnchor.constraint(equalTo: lg.centerYAnchor),
            stackViewPrincipal.centerXAnchor.constraint(equalTo: lg.centerXAnchor),

            iconGreen.widthAnchor.constraint(equalToConstant: 10),
            iconGreen.heightAnchor.constraint(equalToConstant: 10),
            iconGreen.centerYAnchor.constraint(equalTo: buttonContact.centerYAnchor),
            iconGreen.leadingAnchor.constraint(equalTo: buttonContact.leadingAnchor, constant: 8),
            
            buttonContact.widthAnchor.constraint(equalToConstant: 135),
            buttonContact.heightAnchor.constraint(equalToConstant: 30),
            
            buttonTransfer.bottomAnchor.constraint(equalTo: lg.bottomAnchor, constant: -16),
            buttonTransfer.heightAnchor.constraint(equalToConstant: 45),
            buttonTransfer.leadingAnchor.constraint(equalTo: lg.leadingAnchor, constant: 45),
            buttonTransfer.trailingAnchor.constraint(equalTo: lg.trailingAnchor, constant: -45)
        ])
    }
    
}
