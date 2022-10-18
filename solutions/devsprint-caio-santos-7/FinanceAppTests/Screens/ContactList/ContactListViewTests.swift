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
    
    private func testRenderView() {
        let component = ContactListView()
        assertSnapshot(matching: component, as: .image(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)))
    }
}
