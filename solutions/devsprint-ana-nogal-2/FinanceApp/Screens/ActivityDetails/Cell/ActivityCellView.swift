//
//  ActivityCellView.swift
//  FinanceApp
//
//  Created by Razee Hussein-Jamal on 5/19/22.
//

import UIKit

struct ActivityCellConfiguration {
    let icon: String
    let name: String
    let information: String
}

class ActivityCellView: UITableViewCell {
    private lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        
        return iconView
    }()
    
    private lazy var name: UILabel = {
        let name = UILabel()
        name.font = UIFont(name: "SFProText-Semibold", size: 15)
        
        return name
    }()
    
    private lazy var information: UILabel = {
        let information = UILabel()
        information.font = UIFont(name: "SFProText-Regular", size: 13)
        information.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        
        return information
    }()
}

// MARK: - Update Cell View

extension ActivityCellView {
    func updateView(with configuration: ActivityCellConfiguration) {
        self.iconView.image = UIImage(named: configuration.icon)
        self.name.text = configuration.name
        self.information.text = configuration.information
    }
}

#if DEBUG

import SwiftUI

struct ActivityCellView_Preview: PreviewProvider {
    static var previews: some View {
        return SwiftUIPreView { _ in
            let cell = ActivityCellView()
            
            return cell
        }
    }
}
#endif
