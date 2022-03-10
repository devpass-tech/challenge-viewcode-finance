//
//  FinanceServiceStub.swift
//  FinanceAppTests
//
//  Created by Renato Sarro on 09/03/22.
//

import Foundation

@testable import FinanceApp

class FinanceServiceStub: FinanceServiceProtocol {
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        let data = HomeData(balance: 1000.5, savings: 1000.2, spending: 15324.2, activity: [
            Activity(name: "Shopping", price: 500.0, time: "8:35 AM"),
            Activity(name: "Mercado", price: 500.0, time: "18:35 AM"),
            Activity(name: "Cinema", price: 200.0, time: "23:35 AM"),
            Activity(name: "Posto de gasolina", price: 88888888500.0, time: "10:00 AM")
        ])
        
        completion(data)
    }
}
