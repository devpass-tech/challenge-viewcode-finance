//
//  ContactListTableViewCellTests.swift
//  FinanceAppTests
//
//  Created by Gabriel de Castro Chaves on 14/10/22.
//

@testable import FinanceApp
import SnapshotTesting
import XCTest

final class ContactListTableViewCellTests: XCTestCase {
    
    private let cell = ContactListTableViewCell()
    
    override class func setUp() {
//        SnapshotTesting.isRecording = true
    }
    

    
    private func testRenderView() {
        cell.backgroundColor = .white
        assertSnapshot(matching: cell, as: .image(size: CGSize(width: UIScreen.main.bounds.width, height: 64)))
    }
}
