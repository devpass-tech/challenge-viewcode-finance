//
//  ConfirmationViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ConfirmationViewController: UIViewController {

    lazy var imageConfirmation: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(imageLiteralResourceName: "checkmark.circle.fill")
            image.tintColor = UIColor(red: 0.196, green: 0.843, blue: 0.294, alpha: 1)
            image.translatesAutoresizingMaskIntoConstraints = false
            
            return image
        }()
        
        lazy var titleConfirmation: UILabel = {
            let label = UILabel()
            label.text = "Your transfer was successful"
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 17, weight: .bold)
    //        label.textColor
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        
        lazy var buttonConfirmation: UIButton = {
            let button = UIButton()
            button.layer.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1).cgColor
            button.layer.cornerRadius = 14
            
            return button
        }()
    
    override func loadView() {
        self.view = ConfirmationView()
    }
}
