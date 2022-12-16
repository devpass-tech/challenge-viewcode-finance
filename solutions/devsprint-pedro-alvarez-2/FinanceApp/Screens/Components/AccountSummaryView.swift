//
//  AccountSummaryView.swift
//  FinanceApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import UIKit

class AccountSummaryView: UIView {
    // MARK: UI Components
    lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$15,459.27"
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 34)
        label.textAlignment = .left
        return label
    }()
    
    lazy var economyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Savings"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .left
        return label
    }()
    
    lazy var economyValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$1000"
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 34)
        label.textColor = .gray
        label.textAlignment = .right
        return label
    }()
    
    lazy var spendingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Spendings"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .left
        return label
    }()
    
    lazy var spendingValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "500"
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 34)
        label.textColor = .gray
        label.textAlignment = .right
        return label
    }()
    
    lazy var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy var firstStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var secondStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var thirdStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    // MARK: init
    init() {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountSummaryView {

    // MARK: - Private Methods
    private func setupViews() {
        confighierarchy()
        configConstraints()
    }
          private func confighierarchy() {
              
              addSubview(greenView)
              
              addSubview(redView)
              
              addSubview(firstStackView)
              firstStackView.addArrangedSubview(balanceLabel)
              
              addSubview(secondStackView)
              secondStackView.addArrangedSubview(economyLabel)
              secondStackView.addArrangedSubview(economyValueLabel)
              
              addSubview(thirdStackView)
              thirdStackView.addArrangedSubview(spendingLabel)
              thirdStackView.addArrangedSubview(spendingValueLabel)
          }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            greenView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            greenView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            greenView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            greenView.heightAnchor.constraint(equalToConstant: 10.0),
            greenView.widthAnchor.constraint(equalToConstant: 10.0),
            
            redView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            redView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            redView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            redView.heightAnchor.constraint(equalToConstant: 10.0),
            redView.widthAnchor.constraint(equalToConstant: 10.0),
            
            firstStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            firstStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            firstStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            firstStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            secondStackView.topAnchor.constraint(equalTo: self.firstStackView.bottomAnchor, constant: 10),
            secondStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            secondStackView.leadingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: 20.0),
            secondStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0),
            
            
            thirdStackView.topAnchor.constraint(equalTo: self.secondStackView.bottomAnchor, constant: 10),
            thirdStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            thirdStackView.leadingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 20.0),
            thirdStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0),
        ])
    }
}
