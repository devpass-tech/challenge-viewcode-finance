//
//  ContactCellViewTests.swift
//  FinanceAppTests
//
//  Created by Arthur Monteiro on 20/04/22.
//

import XCTest
import SnapshotTesting
import UIKit
@testable import FinanceApp

class ContactCellViewTests: XCTestCase {
    private lazy var defaultStateMock: Contact = Contact(name: "User Name", phone: "+55 61 99999999")
    private lazy var sut: ContactCellView = ContactCellView()
    
    override func setUp() {
        sut.populateCell(contact: Contact(name: "User Name", phone: "+55 61 99999999"))
        sut.frame.size.width = 375
        sut.frame.size.height = 64
    }
    

    func testDefaultState() {
        sut.backgroundColor = .white
        assertSnapshot(matching: sut, as: .image)
    }
    
    func testDarkMode() {
        sut.backgroundColor = .black
        sut.overrideUserInterfaceStyle = .dark
        assertSnapshot(matching: sut, as: .image)
    }
}
