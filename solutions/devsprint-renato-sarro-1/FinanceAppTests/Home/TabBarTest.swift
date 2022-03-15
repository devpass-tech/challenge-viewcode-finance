//
//  TabBarTest.swift
//  FinanceAppTests
//
//  Created by Luiza on 14/03/22.
//

import Foundation
import XCTest
import SnapshotTesting

@testable import FinanceApp

class TabBarSnapshotTests: XCTestCase {
    
    func testTabBarViewController() {
        let view = TabBarViewController()
        assertSnapshot(matching: view, as: .image(on: .iPhoneXr))
    }
}


