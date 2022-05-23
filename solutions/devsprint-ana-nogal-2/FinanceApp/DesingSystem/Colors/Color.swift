//
//  Color.swift
//  FinanceApp
//
//  Created by Pedro Henrique Leda Araujo Guimaraes on 23/05/22.
//

import Foundation
import UIKit

enum Color {
    case green, red, purple, blue, orange, primary, secondary, lightGray, lightGray2, lightGreen
    
    var color: UIColor {
        switch self {
        case .primary: return getPrimaryColor()
        case .secondary: return UIColor(red: 0.24, green: 0.24, blue: 0.26, alpha: 1.00)
        case .green: return UIColor(red: 0.20, green: 0.78, blue: 0.35, alpha: 1.00)
        case .red: return UIColor(red: 1.00, green: 0.23, blue: 0.19, alpha: 1.00)
        case .purple: return UIColor(red: 0.69, green: 0.32, blue: 0.87, alpha: 1.00)
        case .blue: return UIColor(red: 0.35, green: 0.78, blue: 0.98, alpha: 1.00)
        case .orange: return UIColor(red: 1.00, green: 0.62, blue: 0.04, alpha: 1.00)
        case .lightGray: return UIColor(red: 0.898, green: 0.898, blue: 0.918, alpha: 1)
        case .lightGray2: return UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        case .lightGreen: return UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
        }
    }
    
    private func getPrimaryColor() -> UIColor {
        return UIColor.init { (trait) -> UIColor in
            
            if #available(iOS 13, *) {
                return trait.userInterfaceStyle == .dark ?
                UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) :
                UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
            } else {
                return UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
            }
        }
    }
}
