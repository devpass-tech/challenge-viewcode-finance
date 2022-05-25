//
//  ActivityDetailsViewTest.swift
//  FinanceAppTests
//
//  Created by Pedro Henrique Leda Araujo Guimaraes on 24/05/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

class ActivityDetailsViewTest: XCTestCase {

    func test_activityDetailsViewTest() {
        let view = ActivityDetailsViewController()
        view.loadViewIfNeeded()
        assertSnapshot(matching: view, as: .image, named: "ActivityDetailsView", record: false)
    }
}
