//
//  SummaryViewTests.swift
//  FinanceAppTests
//
//  Created by Marcio Migueis on 25/05/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

class SummaryViewTests: XCTestCase {

    func test_snapshot() {
        let sut = SummaryView()
        
        assertSnapshot(matching: sut, as: .image)
    }

}
