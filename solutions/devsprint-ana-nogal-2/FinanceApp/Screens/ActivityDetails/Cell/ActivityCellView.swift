//
//  ActivityCellView.swift
//  FinanceApp
//
//  Created by Razee Hussein-Jamal on 5/19/22.
//

import UIKit

class ActivityCellView: UITableViewCell {
    private lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false

        return iconView
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .boldSystemFont(ofSize: 15)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return nameLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font =  .systemFont(ofSize: 13)
        descriptionLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        return descriptionLabel
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Update Cell View

extension ActivityCellView {
    func updateView(with configuration: ActivityCellConfiguration) {
        self.iconView.image = UIImage(named: configuration.icon)
        self.nameLabel.text = configuration.name
        self.descriptionLabel.text = String.activityDetails(with: configuration.price, and: configuration.time)
    }
}

// MARK: - Customize User Interface

extension ActivityCellView {
    private func configure() {
        configureSubviews()
        configureSubviewsConstraints()
    }
    
    private func configureSubviews() {
        self.addSubview(iconView)
        self.addSubview(nameLabel)
        self.addSubview(descriptionLabel)
    }
    
    private func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.iconView.widthAnchor.constraint(equalToConstant: 48),
            self.iconView.heightAnchor.constraint(equalToConstant: CGFloat(48)),
            self.iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.iconView.topAnchor, constant: 5),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.iconView.trailingAnchor, constant: 12)
        ])
        
        NSLayoutConstraint.activate([
            self.descriptionLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.iconView.trailingAnchor, constant: 12)
        ])
    }
}

#if DEBUG

import SwiftUI

struct ActivityCellView_Preview: PreviewProvider {
    static var previews: some View {
        return SwiftUIPreView { _ in
            let cell = ActivityCellView()
            let configuration = ActivityCellConfiguration(icon: "bag.circle.fill", name: "Mall", price: 100.00, time: "8:75")
            cell.updateView(with: configuration)
            
            return cell
        }
    }
}
#endif
