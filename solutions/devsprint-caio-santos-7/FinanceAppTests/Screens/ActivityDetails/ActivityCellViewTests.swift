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
                
        sut = ActivityCellView()
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64)
        sut?.frame = frame
        
    }
    
    func test_WhenInitActivityCellView_ThenView_ShouldHaveValidSnapshot() throws {
        let unwrappedSut = try XCTUnwrap(sut)
        assertSnapshot(matching: unwrappedSut, as: .image)
        
    }
    
    override func tearDown() {
        sut = nil
    }
}
