//
//  AccountSummaryView.swift
//  FinanceApp
//
//  Created by Marcelo Araujo on 10/08/22.
//

import UIKit

class AccountSummaryView: UIViewController {
    
    
    private let accountSummary: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let balance: UILabel = {
        
        let label = UILabel()
        label.text = "$15,459.27"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var stack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private let greenLabel: UILabel = {
        let label = UILabel()
        
        label.text = "●"
        label.textColor = .green
        label.font = UIFont.systemFont(ofSize: 17)
        
        
        return label
    }()
    
    private let savingLabel: UILabel = {
        let label = UILabel()
        label.text = "Savings"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        
        return label
    }()
    
    private var totalSavingsLabel: UILabel = {
        
        let label = UILabel()
        label.text = "$1000"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 17)
       
        return label
    }()
    
    private var stack2: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private let redLabel: UILabel = {
        let label = UILabel()
        
        label.text = "●"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 17)
        
        
        return label
    }()
    
    private let spendingLabel: UILabel = {
        let label = UILabel()
        label.text = "Spending"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        
        return label
    }()
    
    private var totalSpendingLabel: UILabel = {
        
        let label = UILabel()
        label.text = "$500"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 17)
       
        return label
    }()
    
    
    
    // MARK: - set up constrains
    
    
    private func setUpConstrainsBalanceVeiw(){
        
        NSLayoutConstraint.activate([
            
            accountSummary.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 108),
            accountSummary.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            accountSummary.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            accountSummary.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -639)
            
        ])
        
        
    }
    
    
    private func setUpConstraintsBalance(){
        
        NSLayoutConstraint.activate([
            
            balance.leftAnchor.constraint(equalTo: accountSummary.leftAnchor, constant: 20),
            balance.topAnchor.constraint(equalTo: accountSummary.topAnchor, constant: 20),
            balance.rightAnchor.constraint(equalTo: accountSummary.rightAnchor, constant: 20),
            
        ])
        
    }
    
    private func setUpConstraintsStack(){
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: accountSummary.topAnchor, constant: 91),
            stack.rightAnchor.constraint(equalTo: accountSummary.rightAnchor),
            stack.leftAnchor.constraint(equalTo: accountSummary.leftAnchor)
            
        ])
    }
    
    private func setUpConstraintsGreenLabel(){
        
        NSLayoutConstraint.activate([
            greenLabel.leftAnchor.constraint(equalTo: stack.leftAnchor, constant: 20),
            greenLabel.rightAnchor.constraint(equalTo: stack.rightAnchor,constant: 370)
            
        ])
        
        
    }
    
    private func setUpConstraintsSavings(){
        
        NSLayoutConstraint.activate([
            savingLabel.rightAnchor.constraint(equalTo: stack.rightAnchor,constant: 245),
            savingLabel.leftAnchor.constraint(equalTo: stack.leftAnchor, constant: 54)
            
        ])
        
    }
    
    private func setUpConstraintsTotalSavingLabel(){
        
        NSLayoutConstraint.activate([
            
            totalSavingsLabel.rightAnchor.constraint(equalTo: stack.rightAnchor, constant: 20),
            totalSavingsLabel.leftAnchor.constraint(equalTo: stack.leftAnchor, constant: 350)
            
        ])
        
        
        
    }
    
    private func setUpConstraintsStack2(){
        
        NSLayoutConstraint.activate([
            stack2.topAnchor.constraint(equalTo: accountSummary.topAnchor, constant: 145),
            stack2.rightAnchor.constraint(equalTo: accountSummary.rightAnchor),
            stack2.leftAnchor.constraint(equalTo: accountSummary.leftAnchor)
            
        ])
    }
    
    private func setUpConstraintsRedLabel(){
        
        NSLayoutConstraint.activate([
            redLabel.leftAnchor.constraint(equalTo: stack2.leftAnchor, constant: 20),
            redLabel.rightAnchor.constraint(equalTo: stack2.rightAnchor,constant: 370)
            
        ])
        
        
    }
    
    private func setUpConstraintsSpending(){
        
        NSLayoutConstraint.activate([
            spendingLabel.rightAnchor.constraint(equalTo: stack2.rightAnchor,constant: 245),
            spendingLabel.leftAnchor.constraint(equalTo: stack2.leftAnchor, constant: 54)
            
        ])
        
    }
    
    private func setUpConstraintsTotalSpendingLabel(){
        
        NSLayoutConstraint.activate([
            
            totalSpendingLabel.rightAnchor.constraint(equalTo: stack2.rightAnchor, constant: 20),
            totalSpendingLabel.leftAnchor.constraint(equalTo: stack2.leftAnchor, constant: 350)
            
        ])
        
    }
    
    
    // MARK: - Add Views
    
    private func addSubViews(){
        view.addSubview(accountSummary)
        accountSummary.addSubview(balance)
        accountSummary.addSubview(stack)
        accountSummary.addSubview(stack2)
        
        stack.addArrangedSubview(greenLabel)
        stack.addArrangedSubview(savingLabel)
        stack.addArrangedSubview(totalSavingsLabel)
        
        stack2.addArrangedSubview(redLabel)
        stack2.addArrangedSubview(spendingLabel)
        stack2.addArrangedSubview(totalSpendingLabel)
        
    }
    
    private func constrainSubView(){
        
        self.setUpConstrainsBalanceVeiw()
        self.setUpConstraintsBalance()
        
        self.setUpConstraintsStack()
        self.setUpConstraintsGreenLabel()
        self.setUpConstraintsSavings()
        self.setUpConstraintsTotalSavingLabel()
        
        self.setUpConstraintsStack2()
        self.setUpConstraintsRedLabel()
        self.setUpConstraintsSpending()
        self.setUpConstraintsTotalSpendingLabel()
    }
    
    
    
    // MARK: - Inicialize
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        self.addSubViews()
        self.constrainSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
