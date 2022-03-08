//
//  UserProfileViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class UserProfileViewController: UIViewController {

    lazy var profileContent: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var profileImage: UIImageView = {
       let image = UIImageView()
        image.layer.cornerRadius = 48
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var profileName:UILabel = {
       let label = UILabel()
        label.text = "Irma Flores"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var profileInfo: UILabel = {
       let label = UILabel()
        label.text = "Agency 0001 \n Account 123456-7 \n Devpass Bank"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func loadView() {
        self.view = UserProfileView()
    }
}
