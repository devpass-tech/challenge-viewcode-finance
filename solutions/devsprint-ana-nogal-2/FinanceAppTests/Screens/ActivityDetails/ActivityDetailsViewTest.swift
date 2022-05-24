//
//  ActivityDetailsViewTest.swift
//  FinanceAppTests
//
//  Created by Pedro Henrique Leda Araujo Guimaraes on 24/05/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

class ConfirmationViewTests: XCTestCase {

    func test_defaultApperance() {
        let view = ActivityDetailsView()
        assertSnapshot(matching: view, as: .image)
    }
}
