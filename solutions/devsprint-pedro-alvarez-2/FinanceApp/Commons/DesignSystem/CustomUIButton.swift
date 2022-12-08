//
//  CustomUIButton.swift
//  FinanceApp
//
//  Created by Thyago Raphael on 08/12/22.
//

import UIKit

open class CustomUIButton: UIButton {
    // MARK: - Custom Types
    public enum Style {
        case primary
    }
    
    public enum CornerRadius {
        case medium
    }
    
    // MARK: - UI Components
    public private(set) var style: Style
    public private(set) var cornerRadius: CornerRadius
    public private(set) var title: String
    
    // MARK: - Initialization
    init(style: Style, cornerRadius: CornerRadius, title: String) {
        self.style = style
        self.cornerRadius = cornerRadius
        self.title = title
        super.init(frame: .zero)
        setupUI()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupUI() {
        setupButton()
        handleStyleButton()
        handleCornerRadiusButton()
    }
    
    /// Setup Button
    private func setupButton() {
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
    }
    
    /// Style Button
    private func handleStyleButton() {
        switch style {
        case .primary:
            backgroundColor = UIColor.backgroundButton
            setTitleColor(UIColor.colorWhite, for: .normal)
        }
    }
    
    /// Corner Radius Button
    private func handleCornerRadiusButton() {
        switch cornerRadius {
        case .medium:
            layer.cornerRadius = 14
        }
    }
}


