//
//  Label.swift
//  FinanceApp
//
//  Created by Renato Sarro on 20/06/22.
//

import UIKit

enum LabelStyle {
    case bigTitle, footnote, subheadline
    
    var fontSize: CGFloat {
        switch self {
        case .bigTitle: return 24
        case .footnote: return 13
        case .subheadline: return 15
        }
    }
    
    var weight: UIFont.Weight {
        switch self {
        case .bigTitle: return .bold
        case .footnote: return .regular
        case .subheadline: return .regular
        }
    }
}

extension UILabel {
    static func build(style: LabelStyle, dsColor: DSColor) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: style.fontSize, weight: style.weight)
        label.textColor = dsColor.color
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    func applyStyle(with style: LabelStyle, dsColor: DSColor) {
        font = .systemFont(ofSize: style.fontSize, weight: style.weight)
        textColor = dsColor.color
    }
}
