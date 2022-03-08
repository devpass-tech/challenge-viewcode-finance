//
//  ViewConfiguration.swift
//  FinanceApp
//
//  Created by Edson Neto on 08/03/22.
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
