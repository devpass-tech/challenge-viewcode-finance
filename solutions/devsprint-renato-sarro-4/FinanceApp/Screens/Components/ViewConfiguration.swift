//
//  ViewConfiguration.swift
//  FinanceApp
//
//  Created by Renato Sarro on 13/06/22.
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

extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
}
