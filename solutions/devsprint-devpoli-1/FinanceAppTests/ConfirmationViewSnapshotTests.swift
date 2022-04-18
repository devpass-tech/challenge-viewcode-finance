//
//  ConfirmationViewSnapshotTests.swift
//  FinanceAppUITests
//
//  Created by Arthur Monteiro on 15/04/22.
//

import XCTest
import SnapshotTesting

class ConfirmationViewSnapshotTests: XCTestCase {
    
    func test_confirmationViewControllerDefaultState() {
            let viewController = UINavigationController(rootViewController: ConfirmationViewController())
            verifyViewController(viewController, named: "Default")
        }
        
        private func verifyViewController(_ viewController: UIViewController, named: String) {
            let devices: [String: ViewImageConfig] = ["iPhoneX": .iPhoneX,
                                                      "iPhone8": .iPhone8,
                                                      "iPhoneSe": .iPhoneSe]
            
            let results = devices.map { device in
                verifySnapshot(matching: viewController,
                               as: .image(on: device.value),
                               named: "\(named)-\(device.key)",
                               testName: "ConfirmationViewController")
            }
            
            results.forEach { XCTAssertNil($0) }
        }
}
