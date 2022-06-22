//
//  ADLabel.swift
//  FinanceApp
//
//  Created by Jayme Caironi SIS on 22/06/22.
//

import UIKit

enum ADLabelStyle {
    case largeTitle, semiBold, regular
    
    var fontSize: CGFloat {
        switch self {
        case .largeTitle: return 34
        case .semiBold: return 17
        case .regular: return 15
        }
    }
    
    var weight: UIFont.Weight {
        switch self {
        case .largeTitle: return .bold
        case .semiBold: return .semibold
        case .regular: return .regular
        }
    }
}

extension UILabel {
    static func build(style: ADLabelStyle, adColor: ADColor) -> UILabel {
            let label = UILabel()
            label.font = .systemFont(ofSize: style.fontSize, weight: style.weight)
            label.textColor = adColor.color
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }
    
    func applyStyle(with style: ADLabelStyle, adColor: ADColor) {
        font = .systemFont(ofSize: style.fontSize, weight: style.weight)
        textColor = adColor.color
    }
}
