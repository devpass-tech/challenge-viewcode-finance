//
//  ActivityCellViewTests.swift
//  FinanceAppTests
//
//  Created by Cleber Reis on 13/10/22.
//

import UIKit
import SnapshotTesting
import XCTest

@testable import FinanceApp

final class ActivityCellViewTests: XCTestCase {
    
    private var sut: ActivityCellView?
    
    override func setUp() {
//        SnapshotTesting.isRecording = true
        sut = ActivityCellView()
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64)
        sut?.frame = frame
    }
    
    func test_WhenInitActivityCellView_ThenView_ShouldHaveValidSnapshot() throws {
        let unwrappedSut = try XCTUnwrap(sut)
        assertSnapshot(matching: unwrappedSut, as: .image)
    }
    
    func test_WhenInitActivityCellViewWithBigText_ThenView_ShouldHaveValidSnapshot() throws {
        let unwrappedSut = try XCTUnwrap(sut)
        unwrappedSut.updateValues(activity: Activity(name: "TESTE TESTE TESTE TESTE TESTE TESTE TESTE",
                                                     price: 0,
                                                     time: "TESTE"))
        assertSnapshot(matching: unwrappedSut, as: .image(size: .init(width: UIScreen.main.bounds.width, height: 78)))
    }
    
    func test_WhenInitActivityCellViewWithMall_ThenView_ShouldHaveValidSnapshot() throws {
        let unwrappedSut = try XCTUnwrap(sut)
        unwrappedSut.updateValues(activity: Activity(name: "Mall",
                                                     price: 0,
                                                     time: "TESTE"))
        assertSnapshot(matching: unwrappedSut, as: .image)
    }
    
    func test_WhenInitActivityCellViewWithFoodCourt_ThenView_ShouldHaveValidSnapshot() throws {
        let unwrappedSut = try XCTUnwrap(sut)
        unwrappedSut.updateValues(activity: Activity(name: "Food Court",
                                                     price: 0,
                                                     time: "TESTE"))
        assertSnapshot(matching: unwrappedSut, as: .image)
    }
    
    override func tearDown() {
        sut = nil
    }
}
