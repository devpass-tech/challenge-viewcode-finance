//
//  Button.swift
//  FinanceApp
//
//  Created by Renato Sarro on 20/06/22.
//

import UIKit

enum ButtonStyle {
    case primary, secondary
    
    var color: UIColor {
        return .blue
    }
}

extension UIButton {
    static func build(style: ButtonStyle) -> UIButton {
        let button = UIButton()
        button.backgroundColor = style.color
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
}
