//
//  ViewConfiguration.swift
//  FinanceApp
//
//  Created by Edson Neto on 08/03/22.
//

import UIKit

protocol ViewConfiguration {
    func setupViews()
    func configViews()
    func buildViews()
    func setupConstraints()
}

extension ViewConfiguration {
    func setupViews() {
        configViews()
        buildViews()
        setupConstraints()
    }
}

extension ViewConfiguration where Self: UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach(addSubview)
    }
}

extension ViewConfiguration where Self: UIStackView {
    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach(addArrangedSubview)
    }
}
