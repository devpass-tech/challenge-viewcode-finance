//
//  Color.swift
//  FinanceApp
//
//  Created by Renato Sarro on 20/06/22.
//

import UIKit

enum DSColor: String {
    case primary, secondary, tertiary

    var color: UIColor? {
        UIColor(named: rawValue)
    }
}
