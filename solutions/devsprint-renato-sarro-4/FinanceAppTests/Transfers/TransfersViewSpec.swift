//
//  TransfersViewSpec.swift
//  FinanceAppTests
//
//  Created by Renato Sarro on 22/06/22.
//

import UIKit
import XCTest
import SnapshotTesting

@testable import FinanceApp

final class TransfersViewSpec: XCTestCase {
    private var sut: TransfersView?
    
    override func setUp() {
        sut = TransfersView()
        
        sut?.frame = UIScreen.main.bounds
        sut?.backgroundColor = .white
    }
    
    func test_WhenInitTransfersView_ShouldHaveValidSnapshot() throws {
        let unwrappedSut = try XCTUnwrap(sut)
        assertSnapshot(matching: unwrappedSut, as: .image)
    }
}
