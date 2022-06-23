//
//  ConfirmationView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ConfirmationView: UIView {
    
    // MARK: - Components
    lazy var buttonNice: UIButton = {
        let button = UIButton.build(style: .primary)
        button.setTitle("Nice", for: .normal)
        return button
    }()
    lazy var labelSuccess: UILabel = {
        let label = UILabel.build(style: .bigTitle, dsColor: .primary)
        label.text = "Your Transfer was successfull"
        return label
    }()
    
    lazy var imageLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "buttonSuccess")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configViews()
        setupConstraints()
        setButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Config Subviews
    func configViews() {
        self.addSubview(buttonNice)
        self.addSubview(labelSuccess)
        self.addSubview(imageLogo)
    }
    
    @objc func tappedButton() {
        print("Nice")
    }
    
    func setButton() {
        self.buttonNice.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    // MARK: - Constraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.imageLogo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.labelSuccess.topAnchor.constraint(equalTo: self.imageLogo.bottomAnchor, constant: 8),
            self.labelSuccess.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 34),
            self.labelSuccess.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -34),
            
            self.buttonNice.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            self.buttonNice.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.buttonNice.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.buttonNice.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
