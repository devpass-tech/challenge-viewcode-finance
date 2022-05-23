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
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    private lazy var savingsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    private lazy var spendingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
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
        self.addSubview(savingsLabel)
        self.addSubview(spendingLabel)

        NSLayoutConstraint.activate([
            balanceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            balanceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            balanceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            balanceLabel.bottomAnchor.constraint(equalTo: savingsLabel.topAnchor, constant: 20),


            savingsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            savingsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
// TODO create a stack view for savings and spanding
    }

    func updateView(summaryData: (balance: String, savings: String, spending: String)) {
        balanceLabel.text = summaryData.balance
        savingsLabel.text = summaryData.savings
        spendingLabel.text = summaryData.spending
    }
}

