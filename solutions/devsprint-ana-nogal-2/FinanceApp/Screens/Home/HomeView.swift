//
//  HomeView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

struct HomeViewConfiguration {

    let homeData: HomeData
}

final class HomeView: UIView {
    
    private let listViewCellIdentifier = "ListViewCellIdentifier"
    
    private var activities: [Activity] = []
    
    private lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.listViewCellIdentifier)
        tableView.dataSource = self
        return tableView
    }()
    
    private (set) lazy var profileButton: UIBarButtonItem = {
        let image = UIImage(named: "profile-icon")
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)	
        let barButton = UIBarButtonItem(customView: button)
        return barButton
    }()
    
    init() {
        
        super.init(frame: .zero)
        
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with configuration: HomeViewConfiguration) {
        
        self.activities = configuration.homeData.activity
        self.tableView.reloadData()
    }
    
    
    @objc func profileButtonTapped(_ sender:UIBarButtonItem!) {
        print("profileButtonTapped")
    }
    
}

private extension HomeView {
    
    func setupViews() {
        
        self.backgroundColor = .white
        
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        
        self.addSubview(self.tableView)
    }
    
    func configureSubviewsConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension HomeView: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.activities.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.listViewCellIdentifier)!
        cell.textLabel?.text = self.activities[indexPath.row].name
        return cell
    }
}

