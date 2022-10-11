//
//  ViewCodable.swift
//  FinanceApp
//
//  Created by Caio Santos on 11/10/22.
//

import Foundation

public protocol ViewCodable {
    func buildHierarchy()
    func setupConstraints()
    func applyAdditionalChanges()
}

public extension ViewCodable {
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }

//    func buildHierarchy() {}
//
//    func setupConstraints() {}
//
    func applyAdditionalChanges() {}
}
