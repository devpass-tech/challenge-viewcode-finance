//
//  ActivityCellViewTests.swift
//  FinanceAppTests
//
//  Created by Vinicius Rocha on 14/04/22.
//

import XCTest
import SnapshotTesting
import UIKit
@testable import FinanceApp

class ActivityCellViewTests: XCTestCase {
    
    private lazy var sut: TableViewCellSnapshotContainer<ActivityCellView> = TableViewCellSnapshotContainer<ActivityCellView>(width: 375, configureCell: { cell in
        cell.setupActivity(activity: self.defaultStateMock)
    })
    private lazy var defaultStateMock: Activity = Activity(name: "Mall", price: 100, time: "8:57 AM")

    func testDefaultState() {
        let container = sut
        assertSnapshot(matching: container, as: .image)
    }
    
    func testDarkMode() {
        let container = sut
        container.overrideUserInterfaceStyle = .dark
        assertSnapshot(matching: container, as: .image)
    }
    

}

class TableViewCellSnapshotContainer<Cell: UITableViewCell>: UIView, UITableViewDataSource, UITableViewDelegate {
    typealias CellConfigurator = (_ cell: Cell) -> ()
    typealias HeightResolver = ((_ width: CGFloat) -> (CGFloat))

    private let tableView = UITableView()
    private let configureCell: (Cell) -> ()
    private let heightForWidth: ((CGFloat) -> CGFloat)?
    
    init(width: CGFloat, configureCell: @escaping CellConfigurator, heightForWidth: HeightResolver? = nil) {
        self.configureCell = configureCell
        self.heightForWidth = heightForWidth
        
        super.init(frame: .zero)
        
        tableView.separatorStyle = .none
        tableView.contentInset = .zero
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(Cell.self, forCellReuseIdentifier: "Cell")
        
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            widthAnchor.constraint(equalToConstant: width),
            heightAnchor.constraint(greaterThanOrEqualToConstant: 64.0)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
          withIdentifier: "Cell", for: indexPath
        ) as? Cell ?? Cell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        configureCell(cell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForWidth?(frame.width) ?? UITableView.automaticDimension
    }
}
