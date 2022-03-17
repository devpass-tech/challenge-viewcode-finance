//
//  ConfirmationViewTest.swift
//  FinanceAppTests
//
//  Created by Cora on 14/03/22.
//

import Foundation
import SnapshotTesting
import XCTest

@testable import FinanceApp

class ConfirmationViewTest: XCTestCase {
    func test_ValidateConfirmationViewLayout() {
        let view = ConfirmationViewController()
        assertSnapshot(matching: view, as: .image)
    }
}
