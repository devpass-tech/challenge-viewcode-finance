//
//  LabelStyles.swift
//  FinanceApp
//
//  Created by Renato Sarro on 10/03/22.
//

import UIKit

enum LabelStyles {
    case bigTitle(color: Color)
    case footNote(weight: UIFont.Weight, color: Color)
}

extension UILabel {
    static func build(with style: LabelStyles, alignment: NSTextAlignment = .left, numberOfLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.applyStyle(style: style)
        label.textAlignment = alignment
        label.numberOfLines = numberOfLines
        
        return label
    }
    
    func applyStyle(style: LabelStyles) {
        switch style {
        case .bigTitle(let color):
            applyBigtitle(color: color)
        case .footNote(let weight, let color):
            applyFootNote(weight: weight, color: color)
        }
    }
    
    private func applyBigtitle(color: Color) {
        font = .systemFont(ofSize: 34, weight: .bold)
        textColor = color.color
    }
    
    private func applyFootNote(weight: UIFont.Weight, color: Color) {
        font = .systemFont(ofSize: 13, weight: weight)
        textColor = color.color
    }
}
