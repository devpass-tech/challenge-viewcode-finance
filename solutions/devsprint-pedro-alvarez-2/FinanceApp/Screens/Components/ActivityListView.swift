//
//  ActivityListView.swift
//  FinanceApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import Foundation
import UIKit

class ActivityListView: UIView {
    
    lazy var activityListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.backgroundView = activity
        tableView.register(ActivityCellView.self, forCellReuseIdentifier: ActivityCellView.identifier)
        return tableView
    }()
    
    lazy var activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.style = UIActivityIndicatorView.Style.large
        activity.startAnimating()
  //      activity.hidesWhenStopped = true
        return activity
    }()
    
    public func activityListTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.activityListTableView.delegate = delegate
        self.activityListTableView.dataSource = dataSource
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


extension ActivityListView: ViewCodePipeline {
   
    func setupView() {
        self.backgroundColor = .systemBackground
    }
    
    func configureSubviews() {
        self.addSubview(self.activityListTableView)
        self.addSubview(self.activity)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
        

            self.activityListTableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.activityListTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.activityListTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.activityListTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            self.activity.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.activity.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        
        ])
    }
    
    
}
