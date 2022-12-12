//
//  BaseView.swift
//  FinanceApp
//
//  Created by Kleiton Mendes on 12/12/22.
//

import UIKit

public class BaseView<ViewModel>: UIView {
    open var hierarchies: [BaseViewHierarchy] { [] }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    public var viewModel: ViewModel? {
//        didSet {
//            configureView(viewModel)
//        }
//    }
    
    private func setupHierarchy() {
        for relation in hierarchies {
            for subView in relation.subViews {
                if let stackView = relation.parentView as? UIStackView {
                    stackView.addArrangedSubview(subView)
                } else {
                    relation.parentView.addSubview(subView)
                }
            }
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(constraints)
    }
    
//    open func configureView(_ viewModel: ViewModel?) { }
    
    private func setupView() {
        for relation in hierarchies {
            relation.makeHierarchy()
        }
    }
    
}
