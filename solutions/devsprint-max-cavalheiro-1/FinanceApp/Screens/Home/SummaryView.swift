//
//  SummaryView.swift
//  FinanceApp
//
//  Created by Marcelo Araujo on 15/08/22.
//

import Foundation
import UIKit
class SummaryView: UIView{
    private let containerView: UIView = {
        let view = UIView()
      //  view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "●"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    private let savingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    private var totalSavingsLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    override init(frame: CGRect) {
         super.init(frame: .zero)
        addSubviews()
        setupConstraints()
     }
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    private func addSubviews(){
        addSubview(containerView)
        containerView.addSubview(statusLabel)
        containerView.addSubview(savingLabel)
        containerView.addSubview(totalSavingsLabel)
    }
    private func setupConstraints(){
        
        setUpConstrainsContainerView()
        setUpConstrainsRedLabel()
        setUpConstrainsSavingLabel()
        setUpConstrainstTotalSpendingView()
    }
    public func setUpConstrainsContainerView() {
           NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor)
           ])
       }
    public func setUpConstrainsRedLabel() {
           NSLayoutConstraint.activate([ //tinha um container.view aqui
            statusLabel.topAnchor.constraint(equalTo: topAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
           ])
       }
       public func setUpConstrainsSavingLabel() {
           NSLayoutConstraint.activate([
            savingLabel.topAnchor.constraint(equalTo: topAnchor),
            savingLabel.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor, constant: 30),
           ])
       }
       public func setUpConstrainstTotalSpendingView() {
           NSLayoutConstraint.activate([
            totalSavingsLabel.topAnchor.constraint(equalTo: topAnchor),
            totalSavingsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            totalSavingsLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
           ])
       }
    public func configureLabel(status: UIColor ,spendingText: String, total: String) {
          statusLabel.textColor = status
          savingLabel.text = spendingText
          totalSavingsLabel.text = total
      }
}
