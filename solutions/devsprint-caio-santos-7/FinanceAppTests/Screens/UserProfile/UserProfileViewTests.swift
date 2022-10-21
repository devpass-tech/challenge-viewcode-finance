//
//  UserProfileViewTests.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 21/10/22.
//
@testable import FinanceApp
import SnapshotTesting
import XCTest

final class UserProfileViewTests: XCTestCase {

    func testRenderView() {
        let component = UserProfileView()
        assertSnapshot(matching: component, as: .image(size: CGSize(width: UIScreen.main.bounds.width,
                                                                    height: UIScreen.main.bounds.height)))
    }
    
}
