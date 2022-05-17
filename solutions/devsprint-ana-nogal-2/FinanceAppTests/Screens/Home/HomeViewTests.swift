//
//  HomeViewTests.swift
//  FinanceAppTests
//
//  Created by Marcio Migueis on 16/05/22.
//

import XCTest
@testable import FinanceApp

class HomeViewTests: XCTestCase {

    func test_navigationBar_mustHaveAProfileButton() {
        let sut = HomeView()
        XCTAssertNotNil(sut.profileButton, "Missing profile button")
    }
    
    func test_navigationBar_mustHaveRightButtons() {
        let sut = HomeView()
        XCTAssertNotNil(sut)
    }
}
