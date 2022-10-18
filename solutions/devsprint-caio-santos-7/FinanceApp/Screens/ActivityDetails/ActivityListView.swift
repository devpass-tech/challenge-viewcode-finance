//
//  ActivityListView.swift
//  FinanceApp
//
//  Created by Mauricio on 18/10/22.
//

import UIKit

class ActivityListView: UIView {
    
    private var activities: [Activity] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ActivityCellView.self, forCellReuseIdentifier: ActivityCellView.reuseIdentifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier)

        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
        self.buildHierarchy()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateTableView(with configuration: HomeViewConfiguration) {
        activities = configuration.homeData.activity
        tableView.reloadData()
    }
    
    public func configTableViewProtocol(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
}

extension ActivityListView: ViewCodable {
    func configViews (){
        backgroundColor = .white
    }
    
    func buildHierarchy(){
        addSubview(tableView)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
