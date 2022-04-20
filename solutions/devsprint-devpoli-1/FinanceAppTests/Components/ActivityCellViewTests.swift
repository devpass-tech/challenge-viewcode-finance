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
    
    private lazy var defaultStateMock: Activity = Activity(name: "Mall", price: 100, time: "8:57 AM")
    private lazy var sut: ActivityCellView = ActivityCellView()
    
    override func setUp() {
        sut.setupActivity(activity: defaultStateMock)
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
