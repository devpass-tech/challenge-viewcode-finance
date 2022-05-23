//
//  ActivityDetailsView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ActivityDetailsView: UIView {
    
    private lazy var activityDetailsImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(imageLiteralResourceName: "bag.circle.fill")
        image.tintColor = Color.purple.color
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var titleActivityLabel: UILabel = {
        let label = UILabel()
        label.text = "Mall"
        label.textColor = Color.primary.color
        label.textAlignment = .center
        return label
    }()
}
