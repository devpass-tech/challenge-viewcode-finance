//
//  CustomUIButton.swift
//  FinanceApp
//
//  Created by Thyago Raphael on 08/12/22.
//

import UIKit

public class CustomUIButton: UIButton {
    // MARK: - ViewModel
    public struct ViewModel {
        let style: Style
        let cornerRadius: CornerRadius
        let title: String
        
        public init(style: Style, cornerRadius: CornerRadius, title: String) {
            self.style = style
            self.cornerRadius = cornerRadius
            self.title = title
        }
    }
    
    // MARK: - Custom Types
    public enum Style {
        case primary
    }
    
    public enum CornerRadius {
        case medium
    }
    
    // MARK: - Data properties
    private var viewModel: ViewModel
    
    // MARK: - Initialization
    public init(viewModel: ViewModel, frame: CGRect) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupButton()
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Setup Button
    private func setupButton() {
        setTitle(viewModel.title, for: .normal)
        
        switch viewModel.style {
        case .primary:
            backgroundColor = .blue
            setTitleColor(.white, for: .normal)
        }
        
        switch viewModel.cornerRadius {
        case .medium:
            layer.cornerRadius = 14
        }
    }
}

