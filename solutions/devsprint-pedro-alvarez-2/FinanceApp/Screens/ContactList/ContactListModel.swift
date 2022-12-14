//
//  ContactListModel.swift
//  FinanceApp
//
//  Created by Kleiton Mendes on 09/12/22.
//

import Foundation
import UIKit

struct ContactListModel {
    let name: String
    let phone: String
    let image: UIImage?
}



let contactList: [ContactListModel] = [
    ContactListModel(name: "Ronald Robertson", phone: "+55 (11) 99999-9999", image: UIImage(named: "img")),
    ContactListModel(name: "Johnny Watson", phone: "+55 (11) 99999-9999", image: UIImage(named: "img2")),
    ContactListModel(name: "Annette Cooper", phone: "+55 (11) 99999-9999", image: UIImage(named: "img3")),
    ContactListModel(name: "Arthur Bell", phone: "+55 (11) 99999-9999", image: UIImage(named: "img4")),
    ContactListModel(name: "Jane Warren", phone: "+55 (11) 99999-9999", image: UIImage(named: "img5")),
    ContactListModel(name: "JMorris Henry", phone: "+55 (11) 99999-9999", image: UIImage(named: "img6")),
    ContactListModel(name: "Irma Flores", phone: "+55 (11) 99999-9999", image: UIImage(named: "img7")),
]
