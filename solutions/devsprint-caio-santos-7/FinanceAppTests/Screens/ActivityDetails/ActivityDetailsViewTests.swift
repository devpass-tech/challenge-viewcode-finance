//
//  ActivityDetailsViewTests.swift
//  FinanceAppTests
//
//  Created by Gabriel de Castro Chaves on 13/10/22.
//

@testable import FinanceApp
import SnapshotTesting
import XCTest

final class ActivityDetailsViewTests: XCTestCase {
    
    override class func setUp() {
//        SnapshotTesting.isRecording = true
    }
    
    func testRenderDefaultContent() {
        let component = ActivityDetailsView()
        assertSnapshot(matching: component, as: .image(size: .init(width: 414, height: 896)))
    }
    
    func testRenderUpdatedActivity() {
        let component = ActivityDetailsView()
        component.updateValues(activity: Activity(name: "TESTE", price: 0, time: "TESTE"))
        assertSnapshot(matching: component, as: .image(size: .init(width: 414, height: 896)))
    }
}
