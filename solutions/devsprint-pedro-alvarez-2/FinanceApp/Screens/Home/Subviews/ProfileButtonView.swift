//
//  ProfileButtonView.swift
//  FinanceApp
//
//  Created by Gustavo Rigor on 12/12/22.
//

import UIKit

final class ProfileButtonView: CodeBaseView<String> {

    enum Constants {
        static let imageName: String = "avatar-placeholder"
        static let imageHeight: CGFloat = 36
        static let imageWidth: CGFloat = 36
        static let half: CGFloat = 0.5
    }

    private lazy var profileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Coding
    override public var hierarchies: [HierarchyRelation] {
        [
            .init(parentView: self, subviews: [profileButton]),
        ]
    }
    
    override public var constraints: [NSLayoutConstraint] {
        [
            profileButton.topAnchor.constraint(equalTo: topAnchor),
            profileButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileButton.widthAnchor.constraint(equalToConstant: Constants.imageWidth),
            profileButton.heightAnchor.constraint(equalToConstant: Constants.imageHeight),
            profileButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
    }
    
    override public func configureView(_ viewModel: String?) {
        let image = UIImage(named: viewModel ?? Constants.imageName)
        DispatchQueue.main.async {
            if let image = image {
                UIGraphicsBeginImageContextWithOptions(self.profileButton.frame.size, false, image.scale)
                let rect  = CGRectMake(.zero, .zero, self.profileButton.frame.size.width, self.profileButton.frame.size.height)
                UIBezierPath(roundedRect: rect, cornerRadius: Constants.half * rect.width).addClip()
                image.draw(in: rect)
                let newImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                let color = UIColor(patternImage: newImage!)
                self.profileButton.backgroundColor = color
                self.profileButton.layer.cornerRadius = Constants.half * self.profileButton.bounds.size.width
            }
        }
        
    }

}
