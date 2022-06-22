//
//  TransferContactSelectorView.swift
//  FinanceApp
//
//  Created by Renato Sarro on 22/06/22.
//

import UIKit

final class TransferContactSelectorView: UIView, ViewConfiguration {
    
    private lazy var toContactLabel: UILabel = {
        let label = UILabel.build(style: .subheadline(weight: .regular), dsColor: .secondary)
        label.text = "To"
        
        return label
    }()
    
    private lazy var selectContactLabel: UILabel = {
        let label = UILabel.build(style: .subheadline(weight: .semibold), dsColor: .primary)
        label.text = "Choose contact"
        
        return label
    }()
    
    private lazy var bgSelectContactView: UIView = {
        let view = UIView()
        view.backgroundColor = DSColor.tertiary.color
        view.layer.cornerRadius = 19
        
        return view
    }()
    
    private lazy var selectContactIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = DSColor.green.color
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    // MARK: Initialization
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: ViewConfiguration
    func configViews() {
        
    }
    
    func buildViews() {
        addSubviews([toContactLabel, bgSelectContactView])
        bgSelectContactView.addSubviews([selectContactIndicatorView, selectContactLabel])
    }
    
    func setupConstraints() {
        
        let bottomConstraint = bgSelectContactView.bottomAnchor.constraint(equalTo: bottomAnchor)
        bottomConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            toContactLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            toContactLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            bgSelectContactView.topAnchor.constraint(equalTo: topAnchor),
            bgSelectContactView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bgSelectContactView.leadingAnchor.constraint(equalTo: toContactLabel.trailingAnchor, constant: 13),
            bgSelectContactView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            selectContactLabel.topAnchor.constraint(equalTo: bgSelectContactView.topAnchor, constant: 9),
            selectContactLabel.bottomAnchor.constraint(equalTo: bgSelectContactView.bottomAnchor, constant: -9),
            selectContactLabel.trailingAnchor.constraint(equalTo: bgSelectContactView.trailingAnchor, constant: -13),
            selectContactLabel.leadingAnchor.constraint(equalTo: bgSelectContactView.leadingAnchor, constant: 31),
            
            selectContactIndicatorView.widthAnchor.constraint(equalToConstant: 16),
            selectContactIndicatorView.heightAnchor.constraint(equalToConstant: 16),
            selectContactIndicatorView.centerYAnchor.constraint(equalTo: bgSelectContactView.centerYAnchor),
            selectContactIndicatorView.leadingAnchor.constraint(equalTo: bgSelectContactView.leadingAnchor, constant: 9)
        ])
    }
}
