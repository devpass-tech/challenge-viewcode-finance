//
//  ActivityCellViewTests.swift
//  FinanceAppTests
//
//  Created by Razee Hussein-Jamal on 5/19/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

class ActivityCellViewTests: XCTestCase {

    func test_defaultActivityCellView() {
        let view = ActivityCellView()
        let configuration = ActivityCellConfiguration(icon: "bag.circle.fill", name: "Mall", price: 100.00, time: "8:75 AM")
        view.updateView(with: configuration)
        assertSnapshot(matching: view, as: .image)
    }
}
