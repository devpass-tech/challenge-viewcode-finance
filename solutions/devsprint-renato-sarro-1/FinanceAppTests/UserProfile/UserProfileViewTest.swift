//
//  UserProfileViewTest.swift
//  FinanceAppTests
//
//  Created by Renato Sarro on 09/03/22.
//

import Foundation
import SnapshotTesting
import XCTest

@testable import FinanceApp

class UserProfileViewTest: XCTestCase {
    
    func test_ValidateUserProfileLayout() {
        
        let view = UserProfileViewController()
        assertSnapshot(matching: view, as: .image)
        
    }
    
}
