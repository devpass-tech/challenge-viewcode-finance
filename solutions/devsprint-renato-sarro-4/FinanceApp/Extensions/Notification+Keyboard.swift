//
//  Notification+Keyboard.swift
//  FinanceApp
//
//  Created by Renato Sarro on 23/06/22.
//

import UIKit

extension Notification {
    var leyboardSize: CGSize? {
        (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size
    }
}
