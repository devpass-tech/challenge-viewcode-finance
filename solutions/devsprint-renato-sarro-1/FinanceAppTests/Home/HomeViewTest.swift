//
//  HomeViewTest.swift
//  FinanceAppTests
//
//  Created by Renato Sarro on 09/03/22.
//

import Foundation
import SnapshotTesting
import XCTest

@testable import FinanceApp

class HomeViewTest: XCTestCase {
    
    func test_ValidateHomeViewLayout() {
        let view = HomeViewController(service: FinanceServiceStub(), thread: .global())
        assertSnapshot(matching: UINavigationController(rootViewController: view), as: .image)
    }
}
