//
//  BaseView.swift
//  FinanceApp
//
//  Created by Kleiton Mendes on 12/12/22.
//

import UIKit

class BaseView: UIView {
    open var hierarchies: [BaseViewHierarchy] { [] }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupView() {
        for relation in hierarchies {
            relation.makeHierarchy()
        }
    }
}
