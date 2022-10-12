//
//  UITableViewCell+Extensions.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 24/02/22.
//

import Foundation
import UIKit

extension UITableViewCell {
    public static var reuseIdentifier: String {
        String(describing: self)
    }
    
    public class func createCell<T: UITableViewCell>(for tableView: UITableView,
                                                     at indexPath: IndexPath) -> T? {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: T.self),
                                             for: indexPath) as? T
    }
}
