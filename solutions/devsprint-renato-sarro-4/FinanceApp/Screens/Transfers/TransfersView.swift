//
//  TransfersView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class TransfersView: UIView, ViewConfiguration {
    
    private lazy var valueLabel: UILabel = {
        UILabel()
    }()
    
    private lazy var contactSelectorView: TransferContactSelectorView = {
        TransferContactSelectorView()
    }()
    
    lazy var transferButton: UIButton = {
        UIButton()
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
        backgroundColor = .white
    }
    
    func buildViews() {
        addSubviews([contactSelectorView])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            contactSelectorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            contactSelectorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
