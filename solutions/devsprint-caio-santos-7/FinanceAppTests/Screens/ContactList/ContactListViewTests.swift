//
//  ContactListViewTests.swift
//  FinanceAppTests
//
//  Created by Gabriel de Castro Chaves on 14/10/22.
//

@testable import FinanceApp
import SnapshotTesting
import XCTest

final class ContactListViewTests: XCTestCase {
    
    override class func setUp() {
//        SnapshotTesting.isRecording = true
    }
    
    func testLoadingComponent() {
        let component = ContactListViewController()
        assertSnapshot(matching: component, as: .image(on: .iPhoneX))
    }
    
    func testRenderView() {
        let component = ContactListViewController()
        assertSnapshot(matching: component, as: .image(on: .iPhoneX))
    }
}
