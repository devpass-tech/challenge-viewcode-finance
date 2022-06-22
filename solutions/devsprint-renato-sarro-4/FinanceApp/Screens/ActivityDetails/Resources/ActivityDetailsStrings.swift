//
//  Strings.swift
//  FinanceApp
//
//  Created by Jayme Caironi SIS on 21/06/22.
//

import Foundation

enum ActivityDetailsStrings: String {
    case spendingLocal
    case spendingTipe
    case spendingValue
    case spendingTime
    case buttonText
    
    var localized: String {
        rawValue.localized(tableName: "ActivityDetailsStrings")
    }
}
