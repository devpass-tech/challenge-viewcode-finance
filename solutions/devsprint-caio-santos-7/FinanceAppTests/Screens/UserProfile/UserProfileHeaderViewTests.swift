//
//  UserProfileHeaderViewTests.swift
//  FinanceAppTests
//
//  Created by Cleber Reis on 18/10/22.
//


@testable import FinanceApp
import SnapshotTesting
import XCTest

final class UserProfileHeaderViewTests: XCTestCase {
    
    private var sut: UserProfileHeaderView?
    
    override func setUp() {
        sut = UserProfileHeaderView()

        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 250)
        sut?.frame = frame
    }
    
    func test_WhenInitUserProfileHeaderView_ThenView_ShouldHaveValidSnapshot() throws {
        let unwrappedSut = try XCTUnwrap(sut)
        assertSnapshot(matching: unwrappedSut, as: .image)
    }
    
    override func tearDown() {
        sut = nil
    }
}
