//
//  ActivityCellView.swift
//  FinanceApp
//
//  Created by Edson Neto on 09/03/22.
//

import Foundation
import UIKit

final class ActivityCellView: UITableViewCell, ViewConfiguration {
    static let identifier = "ActivityCell"

    private lazy var icon: UIImageView = {
        let image                   = UIImageView()
        image.image                 = UIImage(imageLiteralResourceName: "bag.circle.fill")
        image.tintColor             = .systemPurple
        image.clipsToBounds         = true
        image.layer.masksToBounds   = true
        image.contentMode           = .scaleAspectFill
        return image
    }()

    private lazy var infoStackView: UIStackView = {
        let stackView           = UIStackView()
        stackView.axis          = .vertical
        stackView.distribution  = .fillEqually
        stackView.alignment     = .leading
        stackView.contentMode   = .left
        stackView.spacing       = ActivityDetailsConstants.negativeSpacing
        stackView.layoutIfNeeded()
        return stackView
    }()

    private lazy var activityTitleLabel: UILabel = {
        let label       = UILabel()
        label.font      = UIFont.boldSystemFont(ofSize: ActivityDetailsConstants.mediumFontSize)
        label.textColor = Color.primary.color
        return label
    }()

    private lazy var activityDetailLabel: UILabel = {
        return UILabel.build(with: .footNote(weight: .regular, color: .secondary))
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configViews() {
        self.accessoryType = .disclosureIndicator
    }

    func buildViews() {
        contentView.addSubviews([icon, infoStackView])
        infoStackView.addArrangedSubviews([activityTitleLabel, activityDetailLabel])
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ActivityDetailsConstants.smallSpacing),
            icon.heightAnchor.constraint(equalToConstant: 48),
            icon.widthAnchor.constraint(equalToConstant: 48),

            infoStackView.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: ActivityDetailsConstants.smallSpacing),
            infoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            infoStackView.heightAnchor.constraint(greaterThanOrEqualTo: icon.heightAnchor),
            infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    func populate(detail: [Activity], indexPath: IndexPath){
        activityTitleLabel.text     = detail[indexPath.row].name
        activityDetailLabel.text    = String.activityDetails(with: detail[indexPath.row].price, and: detail[indexPath.row].time)
        getIcon(activityTitle: activityTitleLabel.text ?? "")
    }
    
    func getIcon(activityTitle: String){
        if activityTitle.contains("Mall"){
            icon.image = UIImage(imageLiteralResourceName: "bag.circle.fill")
            icon.tintColor = .systemPurple
        } else if activityTitle.contains("Food") {
            icon.image = UIImage(imageLiteralResourceName: "fork.knife.circle.fill")
            icon.tintColor = .systemCyan
        } else if activityTitle.contains("Airlines") {
            icon.image = UIImage(imageLiteralResourceName: "airplane.circle.fill")
            icon.tintColor = .systemOrange
        } else if activityTitle.contains("Gym") {
            icon.image = UIImage(imageLiteralResourceName: "heart.circle.fill")
            icon.tintColor = .systemRed
        } else if activityTitle.contains("Transport") {
            icon.image = UIImage(imageLiteralResourceName: "car.circle.fill")
            icon.tintColor = .systemGreen
        }
    }
}
