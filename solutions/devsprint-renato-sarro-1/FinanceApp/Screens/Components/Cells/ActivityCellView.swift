
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
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView           = UIStackView()
        stackView.axis          = .vertical
        stackView.distribution  = .fillEqually
        stackView.alignment     = .leading
        stackView.contentMode   = .left
        stackView.spacing       = -4
        stackView.layoutIfNeeded()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var activityTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)//todo: tirar magic number
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var activityDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)//todo: tirar magic number
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        contentView.addSubview(icon)
        contentView.addSubview(infoStackView)
        
        [activityTitleLabel, activityDetailLabel].forEach(infoStackView.addArrangedSubview)
    }
    
    func setupConstraints() {
        let spacing = 12.0
        
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: spacing),
            icon.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            icon.widthAnchor.constraint(equalTo: icon.heightAnchor),
            
            infoStackView.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: spacing),
            infoStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            infoStackView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
        ])
    }
    
    func populate(detail: ActivityDetails){
        activityTitleLabel.text = detail.name
        activityDetailLabel.text = String.activityDetails(with: detail.price, and: detail.time)
    }
}
