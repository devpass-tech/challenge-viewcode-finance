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
        stack.alignment = .leading
        stack.spacing = 10.0

        return stack
    }()
    
    private func creteCircle(with color: UIColor) -> UIImageView {
        let imageView = UIImageView(image: UIImage(systemName: "circle.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = color
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 16.0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 16.0).isActive = true
        return imageView
    }
    
    private lazy var greenCircle: UIImageView = {
        return creteCircle(with: .green)
    }()
    
    private lazy var savingsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Savings"
        label.heightAnchor.constraint(equalToConstant: 22.0).isActive = true
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
        stack.distribution = .fill
        stack.alignment = .leading
        stack.spacing = 10.0
        return stack
    }()
    
    private lazy var redCircle: UIImageView = {
        creteCircle(with: .red)
    }()
    
    private lazy var spendingTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Spending"
        label.heightAnchor.constraint(equalToConstant: 22.0).isActive = true
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

            savingsStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            savingsStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            savingsStack.topAnchor.constraint(equalTo: self.balanceLabel.bottomAnchor, constant: 20),
            
            spendingStack.leadingAnchor.constraint(equalTo: savingsStack.leadingAnchor),
            spendingStack.trailingAnchor.constraint(equalTo: savingsStack.trailingAnchor),
            spendingStack.topAnchor.constraint(equalTo: self.savingsStack.bottomAnchor, constant: 10),
            redCircle.centerYAnchor.constraint(equalTo: self.spendingStack.centerYAnchor),

            spendingStack.heightAnchor.constraint(equalToConstant: 22.0)
        ])
    }

    func updateView(summaryData: (balance: String, savings: String, spending: String)) {
        balanceLabel.text = summaryData.balance
        savingsLabel.text = summaryData.savings
        spendingLabel.text = summaryData.spending
    }
}

