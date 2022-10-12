//
//  AccountSummaryView.swift
//  FinanceApp
//
//  Created by Caio Santos on 11/10/22.
//

import UIKit

class AccountSummaryView: UIStackView {
    let valuePlaceholder = "$--.--"
    
    // MARK: Private Properties
    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = valuePlaceholder
        label.font = UIFont.boldSystemFont(ofSize: 34)
        return label
    }()

    private lazy var savingsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var savingsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 4
        view.backgroundColor = .green
        return view
    }()

    private lazy var savingsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Savings"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    private lazy var savingsValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = valuePlaceholder
        label.textColor = .lightGray
        label.textAlignment = .right
        return label
    }()

    private lazy var spendingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()

    private lazy var spendingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 4
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var spendingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Spending"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    private lazy var spendingValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = valuePlaceholder
        label.textColor = .lightGray
        label.textAlignment = .right
        return label
    }()
    
    // MARK: Inits
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public Methods
    func updateValues(balance: Float, savings: Float, spending: Float) {
        balanceLabel.text = "$\(balance)"
        savingsValueLabel.text = "$\(savings)"
        spendingValueLabel.text = "$\(spending)"
    }
}

// MARK: - ViewCodable

extension AccountSummaryView: ViewCodable {
    func buildHierarchy() {
        addArrangedSubview(balanceLabel)
        addArrangedSubview(savingsStackView)
        addArrangedSubview(spendingStackView)
        
        savingsStackView.addArrangedSubview(savingsView)
        savingsStackView.addArrangedSubview(savingsLabel)
        savingsStackView.addArrangedSubview(savingsValueLabel)
        
        spendingStackView.addArrangedSubview(spendingView)
        spendingStackView.addArrangedSubview(spendingLabel)
        spendingStackView.addArrangedSubview(spendingValueLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            savingsView.widthAnchor.constraint(equalToConstant: 8),
            savingsView.heightAnchor.constraint(equalToConstant: 8),

            spendingView.widthAnchor.constraint(equalToConstant: 8),
            spendingView.heightAnchor.constraint(equalToConstant: 8)
        ])
    }
    
    func applyAdditionalChanges() {
        axis = .vertical
        spacing = 40

        savingsLabel.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)
        spendingLabel.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)
    }
}
