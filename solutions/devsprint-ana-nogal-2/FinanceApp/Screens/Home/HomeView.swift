//
//  HomeView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

struct HomeViewConfiguration {

    let homeData: HomeData

    var count: Int {
        return homeData.activity.count
    }

    func getName(at index: Int) -> String {
        return homeData.activity[index].name
    }

    private func formatNumber(value: Float) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: value)) ?? ""
    }

    func getSummaryData() -> (String, String, String) {
        (formatNumber(value: homeData.balance),
         formatNumber(value: homeData.savings),
         formatNumber(value: homeData.spending))
    }

}

final class HomeView: UIView {

    private let listViewCellIdentifier = "ListViewCellIdentifier"

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.listViewCellIdentifier)
        tableView.dataSource = self
        return tableView
    }()

    private lazy var summaryView: SummaryView = {
        let view =  SummaryView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var homeConfiguration: HomeViewConfiguration

    init(homeData: HomeViewConfiguration) {
        self.homeConfiguration = homeData
        super.init(frame: .zero)
        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateView(with configuration: HomeViewConfiguration) {

        self.homeConfiguration = configuration
        self.tableView.reloadData()
        self.summaryView.updateView(summaryData: configuration.getSummaryData())
    }
}

private extension HomeView {

    func setupViews() {

        self.backgroundColor = .white

        self.configureSubviews()
        self.configureSubviewsConstraints()
    }

    func configureSubviews() {

        self.addSubview(self.summaryView)
        self.addSubview(self.tableView)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([

            //TODO define contrains of balanceview
            self.summaryView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.summaryView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.summaryView.topAnchor.constraint(equalTo: self.topAnchor,constant: 170.00),

            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.summaryView.bottomAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension HomeView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.homeConfiguration.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: self.listViewCellIdentifier)!
        cell.textLabel?.text = self.homeConfiguration.getName(at: indexPath.row)
        return cell
    }
}

