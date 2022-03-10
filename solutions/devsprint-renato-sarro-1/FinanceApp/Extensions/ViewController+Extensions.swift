//
//  ViewController+Extensions.swift
//  FinanceApp
//
//  Created by Mateus Nazário Coelho on 10/03/22.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedOnScreen() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
