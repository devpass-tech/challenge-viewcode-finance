//
//  UserProfileHeaderViewTests.swift
//  FinanceAppTests
//
//  Created by Vinicius Rocha on 22/04/22.
//

import XCTest
import SnapshotTesting
import UIKit
@testable import FinanceApp

class UserProfileHeaderViewTests: XCTestCase {

    private lazy var sut = UserProfileHeaderView()

    override func setUp() {
        sut.frame.size.width = 420
        sut.frame.size.height = 300
    }

    func testDefaultState() {
        assertSnapshot(matching: sut, as: .image, named: "Default", record: false, testName: "UserProfileHeaderView")
    }

    func testLongName() {
        sut.setupName(name: "lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed molestie nisl mi, nec accumsan ex blandit vitae. Aliquam volutpat orci vitae venenatis consectetur. Nullam facilisis lorem eu justo posuere, sed efficitur purus interdum.")
        assertSnapshot(matching: sut, as: .image, named: "LongName", record: false, testName: "UserProfileHeaderView")
    }
}
