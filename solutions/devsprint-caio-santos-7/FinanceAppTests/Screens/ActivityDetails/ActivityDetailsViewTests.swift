//
//  ActivityDetailsViewTests.swift
//  FinanceAppTests
//
//  Created by Gabriel de Castro Chaves on 13/10/22.
//

@testable import FinanceApp
import SnapshotTesting
import XCTest

final class ActivityDetailsViewTests: XCTestCase {
    
    override class func setUp() {
//        SnapshotTesting.isRecording = true
    }
    
    func testLoadingComponent() {
        let component = ActivityDetailsViewController()
        //component.backgroundColor = .yellow
        assertSnapshot(matching: component, as: .image(on: .iPhoneX))
    }
    
    func testLoadedComponent() {
        let component = ActivityDetailsViewController()
        //component.backgroundColor = .yellow
        assertSnapshot(matching: component, as: .image(on: .iPhoneX))
    }
}
