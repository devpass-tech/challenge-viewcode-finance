//
//  Button.swift
//  FinanceApp
//
//  Created by Jayme Caironi SIS on 21/06/22.
//

import Foundation
import UIKit

enum ButtonStyleBackground: String {
    case issueButtonBackground, issueButtonTitle
    
    var color: UIColor? {
        UIColor(named: rawValue)
    }
}

extension UIButton {
    static func build(buttonStyle: ButtonStyleBackground, buttonText: ButtonStyleBackground) -> UIButton {
        let button = UIButton()
        button.backgroundColor = buttonStyle.color
        button.setTitleColor(buttonText.color, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(ActivityDetailsStrings.buttonText.localized, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.clipsToBounds = true
        button.layer.cornerRadius = 14
        
        return button
    }
}
