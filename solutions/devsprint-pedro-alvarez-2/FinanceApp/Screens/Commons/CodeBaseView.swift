//
//  CodeBaseView.swift
//  Pods
//
//  Created by Pedro Alvarez on 08/12/22.
//
import UIKit

public class CodeBaseView<ViewModel>: UIView {
  open var hierarchies: [HierarchyRelation] { [] }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupHierarchy()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private var viewModel: ViewModel? {
    didSet {
      configureView(viewModel)
    }
  }
  
  public func setupViewModel(_ viewModel: ViewModel) {
    self.viewModel = viewModel
  }
  
  private func setupHierarchy() {
    for relation in hierarchies {
      for subview in relation.subviews {
        if let stackView = relation.parentView as? UIStackView {
          stackView.addArrangedSubview(subview)
        } else {
          relation.parentView.addSubview(subview)
        }
      }
    }
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate(constraints)
  }
  
  open func configureView(_ viewModel: ViewModel?) { }
}
