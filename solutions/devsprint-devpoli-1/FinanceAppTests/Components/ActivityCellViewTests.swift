//
//  ActivityCellViewTests.swift
//  FinanceAppTests
//
//  Created by Vinicius Rocha on 14/04/22.
//

import XCTest
import SnapshotTesting
import UIKit
@testable import FinanceApp

class ActivityCellViewTests: XCTestCase {
    
    private var defaultStateMock: Activity = Activity(name: "Mall", price: 100, time: "8:57 AM")
    private lazy var sut: ActivityCellView = ActivityCellView()
    
    override func setUp() {
        sut.setupActivity(activity: defaultStateMock)
        sut.frame.size.width = 375
        sut.frame.size.height = 64
    }

    func testDefaultState() {
        assertSnapshot(matching: sut, as: .image)
    }
    
    func testLongTitleActivityState() {
        sut.setupActivity(activity: Activity(name: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed molestie nisl mi, nec accumsan ex blandit vitae. Aliquam volutpat orci vitae venenatis consectetur. Nullam facilisis lorem eu justo posuere, sed efficitur purus interdum.", price: 100, time: "8:57 AM"))
        assertSnapshot(matching: sut, as: .image)
    }
    
    func testDarkMode() {
        sut.overrideUserInterfaceStyle = .dark
        assertSnapshot(matching: sut, as: .image)
    }
    

}
