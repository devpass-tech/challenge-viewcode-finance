//
//  UserProfileViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class UserProfileViewController: UIViewController {

    lazy var profileContent: UIStackView = {
       let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.spacing = 8
        stackview.translatesAutoresizingMaskIntoConstraints = false
        
        return stackview
    }()
    
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(imageLiteralResourceName: "ProfilePhoto")
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var profileName:UILabel = {
       let label = UILabel()
        label.text = "Irma Flores"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var profileInfo: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 3
        label.text = "Agency 0001\n Account 123456-7\n Devpass Bank"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
        buildViews()
        setupConstraints()
    }
    
    //MARK: View Configuration
    func configViews() {
        view.backgroundColor = .systemGray6
    }
    
    func buildViews() {
        view.addSubview(profileContent)
        [profileImage, profileName, profileInfo].forEach(profileContent.addArrangedSubview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileContent.topAnchor.constraint(equalTo: view.topAnchor, constant: 44),
            profileContent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileContent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            profileImage.topAnchor.constraint(equalTo: profileContent.topAnchor),
            profileImage.centerXAnchor.constraint(equalTo: profileContent.centerXAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
          
        ])
    }
}
