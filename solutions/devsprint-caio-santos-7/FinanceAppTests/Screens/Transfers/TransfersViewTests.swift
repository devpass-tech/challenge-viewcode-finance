//
//  TransfersViewTests.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 20/10/22.
//

@testable import FinanceApp
import SnapshotTesting
import XCTest

final class TransfersViewTests: XCTestCase {
    
    override class func setUp() {
//        SnapshotTesting.isRecording = true
    }
    
    func testRenderView() {
        let component = TransfersView()
        component.backgroundColor = .white
        assertSnapshot(matching: component, as: .image(size: CGSize(width: UIScreen.main.bounds.width,
                                                                    height: UIScreen.main.bounds.height)))
    }
}
