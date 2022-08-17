//
//  AccountSummaryView.swift
//  FinanceApp
//
//  Created by Marcelo Araujo on 10/08/22.
//

import UIKit

class AccountSummaryView: UIViewController {
    private let balance: UILabel = {
        let label = UILabel()
        label.text = "$15,459.27"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let accountSummary: SummaryView = {
        let view = SummaryView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let accountSummary2: SummaryView = {
        let view = SummaryView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var stack: UIStackView = {
        let stack = UIStackView()
        //stack.spacing = 30.0
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    // MARK: - Inicialize
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        self.addSubViews()
        self.constrainSubView()
        accountSummary.configureLabel(status: .green, spendingText: "Savings", total: "$1000")
        accountSummary2.configureLabel(status: .red, spendingText: "Spending", total: "$500")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Add Views
    private func addSubViews(){
        view.addSubview(balance)
        view.addSubview(stack)
        stack.addArrangedSubview(accountSummary)
        stack.addArrangedSubview(accountSummary2)
    }
    private func constrainSubView(){
        setUpConstraintsBalanceLabel()
        setUpConstrainsStack()
        setUpConstrainsAccountSummary()
        setUpConstrainsAccountSummaryView2()
    }
    // MARK: - set up constrains
    private func setUpConstraintsBalanceLabel(){
        NSLayoutConstraint.activate([
            balance.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 108),
            balance.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])
    }
    private func setUpConstrainsAccountSummary(){
        NSLayoutConstraint.activate([
            accountSummary.topAnchor.constraint(equalTo: balance.bottomAnchor),
            accountSummary.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            accountSummary.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    private func setUpConstrainsAccountSummaryView2(){
        NSLayoutConstraint.activate([
            accountSummary2.topAnchor.constraint(equalTo: accountSummary.bottomAnchor),
            accountSummary2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            accountSummary2.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    private func setUpConstrainsStack(){
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 179),
            stack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

