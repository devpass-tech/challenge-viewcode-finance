//
//  TransferContactSelectorViewSpec.swift
//  FinanceAppTests
//
//  Created by Renato Sarro on 22/06/22.
//

import Foundation
import SnapshotTesting
import XCTest

@testable import FinanceApp

final class TransferContactSelectorViewSpec: XCTestCase {
    
    func test_WhenInitTransferContactSelectorView_ShouldHaveValidSnapshot() {
        let sut = TransferContactSelectorView()
        sut.frame = CGRect(x: 0, y: 0, width: 190, height: 38)
        sut.backgroundColor = .white
        
        assertSnapshot(matching: sut, as: .image)
    }
}
