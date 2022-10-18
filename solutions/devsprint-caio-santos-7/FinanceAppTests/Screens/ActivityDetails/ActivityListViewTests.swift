//
//  ActivityListViewTests.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 18/10/22.
//

import UIKit
import SnapshotTesting
import XCTest

@testable import FinanceApp

final class ActivityListViewTests: XCTestCase {
    
    private var sut: ActivityListView?
    private var activities: [Activity] = [
        .init(name: "Test", price: 99, time: "Test"),
        .init(name: "Test", price: 99, time: "Test"),
        .init(name: "Test", price: 99, time: "Test"),
        .init(name: "Test", price: 99, time: "Test"),
    ]

    override func setUp() {
//        SnapshotTesting.isRecording = true
        sut = ActivityListView()
    }
    
    func testRenderView() throws {
        let unwrappedSut = try XCTUnwrap(sut)
        unwrappedSut.configTableViewProtocol(delegate: self, dataSource: self)
        assertSnapshot(matching: unwrappedSut, as: .image(size: .init(width: UIScreen.main.bounds.width,
                                                                      height: 527)))
    }
}

extension ActivityListViewTests: UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ActivityCellView = .createCell(for: tableView, at: indexPath),
              indexPath.row < activities.count else {
            return .init()
        }
        cell.updateValues(activity: activities[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Activity"
    }
}

