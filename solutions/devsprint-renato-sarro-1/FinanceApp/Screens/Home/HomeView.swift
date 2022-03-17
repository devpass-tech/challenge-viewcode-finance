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

    private var activities: [Activity] = []
    
    private lazy var activityLabel: UILabel = {
        let label = UILabel()
        label.text = "Activity"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 20)
        return label
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ActivityCellView.self, forCellReuseIdentifier: ActivityCellView.identifier)
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
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
        self.tableView.reloadWithAnimation(direction: .vertical(.forward))
    }
}

private extension HomeView {

    func setupViews() {
        self.backgroundColor = .white

        self.configureSubviews()
        self.configureSubviewsConstraints()
    }

    func configureSubviews() {
        addSubviews([activityLabel, tableView])
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
            self.activityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.activityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.activityLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: activityLabel.bottomAnchor, constant: 16),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension HomeView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.activities.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivityCellView.identifier) as! ActivityCellView
        cell.populate(detail: activities, indexPath: indexPath)
        return cell
    }
}

