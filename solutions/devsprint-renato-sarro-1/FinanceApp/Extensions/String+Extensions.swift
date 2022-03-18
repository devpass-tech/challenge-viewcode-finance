//
//  String+Extensions.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 24/02/22.
//

import Foundation

extension String {

    static func activityDetails(with price: Float, and time: String) -> String {

        return "$\(price) • \(time)"
    }
    
    var currencyInputFormatting: String {
        var number: NSNumber
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currencyAccounting
        formatter.currencySymbol = "R$"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        let double = (self as NSString).doubleValue
        number = NSNumber(value: (double / 100))
        
        guard number != 0 as NSNumber else {
            return "R$ 0,00"
        }
        
        return formatter.string(from: number) ?? ""
    }
}
