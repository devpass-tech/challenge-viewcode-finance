//
//  ConfirmationViewSnapshotTests.swift
//  FinanceAppUITests
//
//  Created by Arthur Monteiro on 15/04/22.
//

import XCTest
import SnapshotTesting

class ConfirmationViewSnapshotTests: XCTestCase {
    
    func test_image() {
        let imageView = UIImageView()
        let image = UIImage(named: "checkmark.circle.fill")
        imageView.image = image
        imageView.tintColor = UIColor.systemGreen
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let result = verifySnapshot(matching: imageView, as: .image, named: "Default", testName: "Image")
        XCTAssertNil(result)
      }
    
    func test_label() {
        let label = UILabel()
        label.text = "Your transfer was successful"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
          
        let result = verifySnapshot(matching: label, as: .image, named: "Default", testName: "Label")
        XCTAssertNil(result)
      }
      
    func test_button() {
        let button = UIButton(type: .custom)
        button.setTitle("Nice", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 14
        button.translatesAutoresizingMaskIntoConstraints = false
          
        let result = verifySnapshot(matching: button, as: .image, named: "Default", testName: "Button")
        XCTAssertNil(result)
      }
}
