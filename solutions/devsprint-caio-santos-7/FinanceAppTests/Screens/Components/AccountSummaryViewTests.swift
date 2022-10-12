//
//  AccountSummaryViewTests.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 12/10/22.
//

@testable import FinanceApp
import SnapshotTesting
import XCTest

class AccountSummaryViewTests: XCTestCase {
    
    override class func setUp() {
//        SnapshotTesting.isRecording = true
    }
    
    func testLoadingComponent() {
        let component = AccountSummaryView()
        component.backgroundColor = .yellow
        assertSnapshot(matching: component, as: .image(size: .init(width: 382, height: 162)))
    }
    
    func testLoadedComponent() {
        let component = AccountSummaryView()
        component.backgroundColor = .yellow
        component.updateValues(balance: 99.99, savings: 99.99, spending: 99.99)
        assertSnapshot(matching: component, as: .image(size: .init(width: 382, height: 162)))
    }
}
