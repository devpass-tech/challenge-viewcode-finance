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
    func test_WhenInitTransfersView_ShouldHaveValidSnapshot() {
        let sut = TransfersView()
        sut.frame = UIScreen.main.bounds
        sut.backgroundColor = .white
        
        assertSnapshot(matching: sut, as: .image)
    }
}
