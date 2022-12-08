//
//  UIColor+Extensions.swift
//  FinanceApp
//
//  Created by Thyago Raphael on 08/12/22.
//

import UIKit

public extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255,
                 green: CGFloat(green) / 255,
                 blue: CGFloat(blue) / 255,
                 alpha: alpha)
    }
  
    static let backgroundButton = UIColor(red: 0, green: 122, blue: 255)
    static let colorWhite = UIColor(red: 255, green: 255, blue: 255)
}
