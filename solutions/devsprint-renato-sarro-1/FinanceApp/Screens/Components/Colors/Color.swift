//
//  Color.swift
//  FinanceApp
//
//  Created by Renato Sarro on 10/03/22.
//

import Foundation
import UIKit

enum Color {
    case green, red, purple, blue, orange, primary, secondary
    
    var color: UIColor {
        switch self {
        case .primary: return UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        case .secondary: return UIColor(red: 0.24, green: 0.24, blue: 0.26, alpha: 1.00)
        case .green: return UIColor(red: 0.20, green: 0.78, blue: 0.35, alpha: 1.00)
        case .red: return UIColor(red: 1.00, green: 0.23, blue: 0.19, alpha: 1.00)
        case .purple: return UIColor(red: 0.69, green: 0.32, blue: 0.87, alpha: 1.00)
        case .blue: return UIColor(red: 0.35, green: 0.78, blue: 0.98, alpha: 1.00)
        case .orange: return UIColor(red: 1.00, green: 0.62, blue: 0.04, alpha: 1.00)
        }
    }
}
