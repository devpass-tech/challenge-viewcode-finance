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
        sut.frame = CGRect(x: 0, y: 0, width: 320, height: 180)
        sut.updateView(summaryData: (balance: "$ 1,000.00", savings: "$ 200.00", spending: "$ 120.00"))
        sut.layoutIfNeeded()
        
        assertSnapshot(matching: sut, as: .image, record: false)
    }

}
