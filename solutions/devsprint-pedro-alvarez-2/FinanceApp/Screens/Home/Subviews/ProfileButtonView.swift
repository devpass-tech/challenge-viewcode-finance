//
//  ProfileButtonView.swift
//  FinanceApp
//
//  Created by Gustavo Rigor on 12/12/22.
//

import UIKit

class ProfileButtonView: CodeBaseView<ProfileButtonView.ViewModel> {
    
    //MARK: - Custom Data
    struct ViewModel {
        let image: String
        
        init(image: String) {
            self.image = image
        }
    }

    enum Constants {
        static let imageName: String = "avatar-placeholder"
        static let imageHeight: CGFloat = 36
        static let imageWidth: CGFloat = 36
        static let half: CGFloat = 0.5
    }

    private lazy var profileButton: UIButton = {
        let button = UIButton()
        button.frame = CGRectMake(.zero, .zero, Constants.imageHeight, Constants.imageWidth)
        let image = UIImage(named: Constants.imageName)
        if let image = image {
            UIGraphicsBeginImageContextWithOptions(button.frame.size, false, image.scale)
            
            let rect  = CGRectMake(.zero, .zero, button.frame.size.width, button.frame.size.height)
            UIBezierPath(roundedRect: rect, cornerRadius: Constants.half * rect.width).addClip()
            image.draw(in: rect)
            
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            
            let color = UIColor(patternImage: newImage!)
            button.backgroundColor = color
            button.layer.cornerRadius = Constants.half * button.bounds.size.width
        }
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
            profileButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
    }
    
    override public func configureView(_ viewModel: ViewModel?) {
        // Configure
    }

}
