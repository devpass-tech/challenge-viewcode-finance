//
//  Color.swift
//  FinanceApp
//
//  Created by Jayme Caironi SIS on 21/06/22.
//

import UIKit

enum ADColor: String {
    case backgroundScreen, primary, secundary
    
//    issueButtonBackground, issueButtonTitle,
    
    var color: UIColor? {
        UIColor(named: rawValue)
    }
}
