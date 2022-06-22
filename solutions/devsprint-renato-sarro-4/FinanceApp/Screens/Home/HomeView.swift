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
    private weak var delegate: HomeViewControllerProtocol?

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ActivityListTableViewCell.self, forCellReuseIdentifier: ActivityListTableViewCell.reuseId)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    init(delegate: HomeViewControllerProtocol) {
        
        self.delegate = delegate

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

extension HomeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.showDetails()
    }
}

extension HomeView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.activities.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ActivityListTableViewCell.reuseId) as? ActivityListTableViewCell else { return UITableViewCell() }
        cell.setupViews(model: activities[indexPath.row])

        return cell
    }
}
