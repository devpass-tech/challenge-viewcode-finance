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
    private lazy var sut: ContactCellView = ContactCellView()
    
    func testDefaultState() {
        assertSnapshot(matching: makeSut(), as: .image)
    }
    
    func makeSut() -> ContactCellView {
        let sut = ContactCellView()
        sut.populateCell(contact: Contact(name: "User Name", phone: "+55 61 99999999"))
        sut.frame.size.width = 375
        sut.frame.size.height = 64
        
        return sut
    }
}
