//
//  ActivityDetailsViewTest.swift
//  FinanceAppTests
//
//  Created by Bruno Vieira Souza on 11/03/22.
//

import Foundation
import SnapshotTesting
import XCTest

@testable import FinanceApp

class ActivityDetailsViewTest: XCTestCase {
    
    func test_ValidateUserProfileLayout() {
        
        let view = ActivityDetailsViewController()
        assertSnapshot(matching: view, as: .image)
        
    }
}
