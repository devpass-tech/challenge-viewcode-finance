//
//  ViewConfiguration.swift
//  FinanceApp
//
//  Created by Renato Sarro on 13/06/22.
//

import Foundation

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
