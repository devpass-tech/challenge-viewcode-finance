//
//  ConfirmationViewTests.swift
//  FinanceAppTests
//
//  Created by Razee Hussein-Jamal on 5/23/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

class ConfirmationViewTests: XCTestCase {

    func test_defaultApperance() {
        let controller = ConfirmationViewController()
        assertSnapshot(matching: controller, as: .image)
    }
}
