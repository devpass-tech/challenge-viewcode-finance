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
    
    let sut = ContactListTableViewCell()
    
    override class func setUp() {
//        SnapshotTesting.isRecording = true
    }
    

    
    func testRenderView() {
        sut.backgroundColor = .white
        assertSnapshot(matching: sut, as: .image(size: CGSize(width: UIScreen.main.bounds.width, height: 64)))
    }
}
