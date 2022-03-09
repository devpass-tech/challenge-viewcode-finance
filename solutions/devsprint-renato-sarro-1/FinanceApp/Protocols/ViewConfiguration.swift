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
    /// Call this method to add a list of views in hierarchy
    /// - Parameter subviews: List of views to be added
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
}

extension ViewConfiguration where Self: UIStackView {
    /// Call this method to add a list of arranged views in hierarchy
    /// - Parameter subviews: List of views to be added
    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addArrangedSubview($0)
        }
    }
}
