//
//  ConfirmationViewTests.swift
//  FinanceAppTests
//
//  Created by Mauricio on 19/10/22.
//

@testable import FinanceApp
import SnapshotTesting
import XCTest

final class ConfirmationViewTests: XCTestCase {
    
    override class func setUp() {
//        SnapshotTesting.isRecording = true
    }
    
    func testRenderView() {
        let component = ConfirmationView()
        component.backgroundColor = .white
        assertSnapshot(matching: component, as: .image(size: CGSize(width: UIScreen.main.bounds.width,
                                                                    height: UIScreen.main.bounds.height)))
    }
}
