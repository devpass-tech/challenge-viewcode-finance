//
//  ViewCodePipeline.swift
//  FinanceApp
//
//  Created by Henrique Marques on 10/12/22.
//

import Foundation

protocol ViewCodePipeline {
    func initView()
    func setupView()
    func configureSubviews()
    func configureSubviewsConstraints()
    
}

extension ViewCodePipeline {
    func initView() {
        setupView()
        configureSubviews()
        configureSubviewsConstraints()
    }
}
