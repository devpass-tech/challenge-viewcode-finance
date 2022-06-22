//
//  ActivityDetailsView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol MallScreenProtocol: AnyObject{
    func actionIssueButton()
}

class ActivityDetailsView: UIView {
    
    private weak var delegate:MallScreenProtocol?
    
    func delegate(delegate:MallScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var imageLogo:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "mall")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var screenTitleLabel:UILabel = {
        let label = UILabel.build(style: .semiBold, adColor: .primary)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.boldSystemFont(ofSize: 20)
//        label.textColor = .black
        label.text = ActivityDetailsStrings.spendingLocal.localized
        return label
    }()
    
    lazy var screenSubTitleLabel:UILabel = {
        let label = UILabel.build(style: .regular, adColor: .secundary)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 16)
//        label.textColor = .lightGray
        label.text = ActivityDetailsStrings.spendingTipe.localized
        return label
    }()
    
    lazy var transactionValueLabel:UILabel = {
        let label = UILabel.build(style: .largeTitle, adColor: .primary)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.boldSystemFont(ofSize: 40)
//        label.textColor = .black
        label.text = ActivityDetailsStrings.spendingValue.localized
        return label
    }()
    
    lazy var transactionTimeLabel:UILabel = {
        let label = UILabel.build(style: .regular, adColor: .secundary)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 20)
//        label.textColor = .lightGray
        label.text = ActivityDetailsStrings.spendingTime.localized
        return label
    }()
    
    lazy var reportIssueButton:UIButton = {
        let button = UIButton.build(buttonStyle: .issueButtonBackground, buttonText: .issueButtonTitle)

        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackground()
        self.configSuperView()
        self.setupConstrainsts()
    }
    
    public func configBackground(){
        self.backgroundColor = ADColor.backgroundScreen.color
    }
    
    private func configSuperView(){
        self.addSubview(self.imageLogo)
        self.addSubview(self.screenTitleLabel)
        self.addSubview(self.screenSubTitleLabel)
        self.addSubview(self.transactionValueLabel)
        self.addSubview(self.transactionTimeLabel)
        self.addSubview(self.reportIssueButton)
    }
    
    @objc private func tappedIssueButton(){
        self.delegate?.actionIssueButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstrainsts(){
        NSLayoutConstraint.activate([
            self.imageLogo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12),
            self.imageLogo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageLogo.heightAnchor.constraint(equalToConstant: 100),

            self.screenTitleLabel.topAnchor.constraint(equalTo: self.imageLogo.bottomAnchor, constant: 8),
            self.screenTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            self.screeTitleLabel.bottomAnchor.constraint(equalTo: self.screenSubTitleLabel.topAnchor, constant: 16),
            
            self.screenSubTitleLabel.topAnchor.constraint(equalTo: self.screenTitleLabel.bottomAnchor, constant: 8),
            self.screenSubTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            self.screenSubTitleLabel.bottomAnchor.constraint(equalTo: self.transactionValueLabel.topAnchor, constant: 16),
            
            self.transactionValueLabel.topAnchor.constraint(equalTo: self.screenSubTitleLabel.bottomAnchor, constant: 132),
            self.transactionValueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            self.transactionValueLabel.bottomAnchor.constraint(equalTo: self.transactionTimeLabel.topAnchor, constant: 8),
            
            self.transactionTimeLabel.topAnchor.constraint(equalTo: self.transactionValueLabel.bottomAnchor,constant: 8),
            self.transactionTimeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            self.transactionTimeLabel.bottomAnchor.constraint(equalTo: self.reportIssueButton.topAnchor, constant: 16),
            
            self.reportIssueButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 19),
            self.reportIssueButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.reportIssueButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            self.reportIssueButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
}
