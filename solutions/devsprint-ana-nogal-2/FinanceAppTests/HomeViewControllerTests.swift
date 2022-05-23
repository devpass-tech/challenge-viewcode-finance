//
//  HomeViewControllerTests.swift
//  FinanceAppTests
//
//  Created by Marcio Migueis on 23/05/22.
//

import SnapshotTesting
import XCTest
@testable import FinanceApp

class HomeViewControllerTests: XCTestCase {

    func test_profileButton() {
        let vc = HomeViewController()

        assertSnapshot(matching: vc, as: .image)
      }

}
