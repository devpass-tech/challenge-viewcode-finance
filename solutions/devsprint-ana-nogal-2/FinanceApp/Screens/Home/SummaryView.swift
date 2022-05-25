//
//  SummaryView.swift
//  FinanceApp
//
//  Created by Marcio Migueis on 21/05/22.
//

import Foundation
import UIKit

class SummaryView: UIView {

    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 34)
        return label
    }()
    
    private lazy var savingsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [greenCircle, savingsTitleLabel, savingsLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.backgroundColor = .lightGray
        return stack
    }()
    
    private lazy var greenCircle: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "circle.fill"))
        imageView.tintColor = .green
        return imageView
    }()
    
    private lazy var savingsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Savings"
        return label
    }()
     
    private lazy var savingsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 142/255, green: 142/255, blue: 147/244, alpha: 1.0)
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    private lazy var spendingStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [redCircle, spendingTitleLabel, spendingLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.backgroundColor = .gray
        return stack
    }()
    
    private lazy var redCircle: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "circle.fill"))
        imageView.tintColor = .red
        return imageView
    }()
    
    
    
    private lazy var spendingTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Spending"
        return label
    }()

    private lazy var spendingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 142/255, green: 142/255, blue: 147/244, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .right
        return label
    }()

    init() {
        super.init(frame: .zero)

        self.setupElements()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupElements() {
        self.addSubview(balanceLabel)
        self.addSubview(savingsStack)
        self.addSubview(spendingStack)

        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 180.0),
            
            balanceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            balanceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: -20),
            balanceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            //balanceLabel.bottomAnchor.constraint(equalTo: savingsLabel.topAnchor, constant: 20),
            balanceLabel.heightAnchor.constraint(equalToConstant: 80.0),

            greenCircle.widthAnchor.constraint(equalToConstant: 15.0),
            greenCircle.heightAnchor.constraint(equalTo: greenCircle.widthAnchor),
            savingsStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            savingsStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            savingsStack.topAnchor.constraint(equalTo: self.balanceLabel.bottomAnchor, constant: 20),
            
            
            spendingTitleLabel.heightAnchor.constraint(equalToConstant: 36),
            spendingStack.leadingAnchor.constraint(equalTo: savingsStack.leadingAnchor),
            spendingStack.trailingAnchor.constraint(equalTo: savingsStack.trailingAnchor),
            spendingStack.topAnchor.constraint(equalTo: self.savingsStack.bottomAnchor, constant: 10),
            spendingStack.heightAnchor.constraint(equalToConstant: 32.0),
            redCircle.widthAnchor.constraint(equalToConstant: 15.0),
            redCircle.heightAnchor.constraint(equalToConstant: 15.0),
            redCircle.centerYAnchor.constraint(equalTo: spendingStack.centerYAnchor),
//            redCircle.topAnchor.constraint(equalTo: spendingStack.topAnchor, constant: 2.0),
//            redCircle.bottomAnchor.constraint(equalTo: spendingStack.bottomAnchor, constant: -5.0),

        ])
// TODO create a stack view for savings and spanding
    }

    func updateView(summaryData: (balance: String, savings: String, spending: String)) {
        balanceLabel.text = summaryData.balance
        savingsLabel.text = summaryData.savings
        spendingLabel.text = summaryData.spending
    }
}

