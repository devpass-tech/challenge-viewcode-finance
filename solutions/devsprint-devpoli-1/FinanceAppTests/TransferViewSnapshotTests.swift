//
//  TransferViewSnapshotTests.swift
//  FinanceAppTests
//
//  Created by Pedro Léda on 20/04/22.
//

import XCTest
import SnapshotTesting

class TransferViewSnapshotTests: XCTestCase {

    func test_image() {
        let image = UIImageView()
        image.image = UIImage(named: "statusImage")
        image.translatesAutoresizingMaskIntoConstraints = false

        let result = verifySnapshot(matching: image, as: .image, named: "Default", testName: "Image")
        XCTAssertNil(result)
      }

    func test_label() {
        let label = UILabel()
        label.text = "Choose contact"
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false

        let result = verifySnapshot(matching: label, as: .image, named: "Default", testName: "Label")
        XCTAssertNil(result)
      }

    func test_button() {
        let button = UIButton()
        button.setTitle("Transfer", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15

        let result = verifySnapshot(matching: button, as: .image, named: "Default", testName: "Button")
        XCTAssertNil(result)
      }
}
