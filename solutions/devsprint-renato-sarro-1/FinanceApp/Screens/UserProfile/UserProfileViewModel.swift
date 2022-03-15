//
//  UserProfileViewModel.swift
//  FinanceApp
//
//  Created by Renato Sarro on 14/03/22.
//

import Foundation

struct UserProfileViewModel {
    struct Config {
        var title: String
        var detail: String?
        var allowSelection: Bool
    }

    enum Section: Int {
        case account, general
        
        var title: String {
            switch self {
            case .account:
                return "MY ACCOUNT"
            case .general:
                return "GENERAL"
            }
        }
        
        var itens: [Config] {
            switch self {
            case .account:
                return [
                    Config(title: "Phone", detail: "+55 (11) 99999-9999", allowSelection: false),
                    Config(title: "E-mail", detail: "user@devpass.com", allowSelection: false),
                    Config(title: "Address", detail: "Rua Bela Cintra, 495", allowSelection: false),
                    Config(title: "Personal data", allowSelection: true),
                    Config(title: "Bank account", allowSelection: true),
                    Config(title: "Taxes", allowSelection: true)
                ]
            case .general:
                return [
                    Config(title: "Need help?", allowSelection: true),
                    Config(title: "About Devpass", allowSelection: true),
                    Config(title: "App Version", detail: "1.0 (1)", allowSelection: false)
                ]
            }
        }
    }
    
    var listSections: [Section] {
        [.account,
         .general]
    }
    
}
