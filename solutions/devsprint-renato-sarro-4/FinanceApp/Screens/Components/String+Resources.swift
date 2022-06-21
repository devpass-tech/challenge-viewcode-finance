//
//  String+Resources.swift
//  FinanceApp
//
//  Created by Renato Sarro on 20/06/22.
//

import Foundation

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: "**\(self)**", comment: "")
    }
}
