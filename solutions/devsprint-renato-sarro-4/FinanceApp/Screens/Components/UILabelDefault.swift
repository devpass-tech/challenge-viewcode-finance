//
//  UILabelDefault.swift
//  FinanceApp
//
//  Created by Kaique Lopes de Oliveira on 15/06/22.
//

import Foundation
import UIKit

class UILabelDefault: UILabel {
     init(text: String) {
        super.init(frame: .zero)
        
        initDefault(text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(text: String) {
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .black
        self.font = UIFont.boldSystemFont(ofSize: 25)
    }
}
