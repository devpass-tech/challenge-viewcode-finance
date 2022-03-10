//
//  Color.swift
//  FinanceApp
//
//  Created by Renato Sarro on 10/03/22.
//

import Foundation
import UIKit

enum Color {
    case primary, secondary
    
    var color: UIColor {
        switch self {
        case .primary:
            return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        case .secondary:
            return UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        }
    }
}
