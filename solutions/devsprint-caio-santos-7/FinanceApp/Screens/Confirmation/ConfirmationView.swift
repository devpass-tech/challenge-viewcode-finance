//
//  ConfirmationView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol ConfirmationViewDelegate:AnyObject{
    func tappedConfirmationButton()
}

class ConfirmationView: UIView {
    
    weak var delegate: ConfirmationViewDelegate?
    
    private lazy var confirmationImage: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "checkmark.circle.fill")
        element.contentMode = .scaleAspectFill
        element.tintColor = UIColor(red: 0/255, green: 220/255, blue: 41/255, alpha: 1)
        return element
    }()
    
    private lazy var confirmationLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Your transfer was successful"
        element.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return element
    }()
    
    private lazy var confirmationButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = UIColor(red: 0/255, green: 120/255, blue: 255/255, alpha: 1)
        element.layer.cornerRadius = 10
        element.setTitle("Nice", for: .normal)
        element.setTitleColor(UIColor.white, for: .normal)
        element.addTarget(self, action: #selector(self.confirmationButtonPressed), for: .touchUpInside)
        return element
    }()
    
    @objc func confirmationButtonPressed(){
        print("Configurar ConfirmationViewDelegate")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        buildHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ConfirmationView:  ViewCodable{
   
    func setUpViews(){
        backgroundColor = .white
    }
    
    func buildHierarchy(){
        addSubview(confirmationImage)
        addSubview(confirmationLabel)
        addSubview(confirmationButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            confirmationImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            confirmationImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            confirmationImage.widthAnchor.constraint(equalToConstant: 64),
            confirmationImage.heightAnchor.constraint(equalToConstant: 64),
            
            confirmationLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            confirmationLabel.topAnchor.constraint(equalTo: self.confirmationImage.bottomAnchor, constant: 8),
            
            confirmationButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            confirmationButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            confirmationButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            confirmationButton.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
}
