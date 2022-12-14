//
//  ActivityCellView.swift
//  FinanceApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import UIKit

class ActivityCellView: UITableViewCell {
    
    static let identifier = "ActivityCellView"
    
    lazy var iconImageView: UIImageView = {
        let image = UIImage(named: "bag.circle.fill")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.frame.size = CGSize(width: 48, height: 48)
        return imageView
    }()
    
    lazy var storeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension ActivityCellView: ViewCodePipeline {
   
    func setupView() {
        self.backgroundColor = .systemBackground
    }
    
    func configureSubviews() {
        self.addSubview(self.iconImageView)
        self.addSubview(self.storeLabel)
        self.addSubview(self.valueLabel)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
        
            self.iconImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            self.iconImageView.heightAnchor.constraint(equalToConstant: 48),
            self.iconImageView.widthAnchor.constraint(equalToConstant: 48),
            self.iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            self.storeLabel.leftAnchor.constraint(equalTo: self.iconImageView.rightAnchor, constant: 10),
            self.storeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10),
            
            self.valueLabel.topAnchor.constraint(equalTo: self.storeLabel.bottomAnchor, constant: 2.5),
            self.valueLabel.leftAnchor.constraint(equalTo: self.storeLabel.leftAnchor), 
        ])
    }
    
    
}
