//
//  Color.swift
//  FinanceApp
//
//  Created by Jayme Caironi SIS on 21/06/22.
//

import UIKit

enum ADColor: String {
    case backgroundScreen, primary, secondary
    
    var color: UIColor? {
        UIColor(named: rawValue)
    }
}
