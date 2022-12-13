//
//  BaseViewHierarchy.swift
//  FinanceApp
//
//  Created by Kleiton Mendes on 12/12/22.
//

import UIKit

struct BaseViewHierarchy {
    let parentView: UIView
    let subViews: [UIView]
    
    init(parentView: UIView, subViews: [UIView]) {
        self.parentView = parentView
        self.subViews = subViews
    }
    
    func makeHierarchy() {
        if let stackView = parentView as? UIStackView {
            for view in subViews {
                stackView.addArrangedSubview(view)
            }
        } else {
            for view in subViews {
                parentView.addSubview(view)
            }
        }
    }
}
