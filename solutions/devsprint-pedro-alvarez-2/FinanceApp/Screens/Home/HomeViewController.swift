//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class HomeViewController: UIViewController {

    private let service = FinanceService()
    
    var activityListView: ActivityListView?
    var ActivityData: [Activity] = []
    
    private let homeView: HomeView = {

        let homeView = HomeView()
        return homeView
    }()

    override func viewDidLoad() {
        self.activityListView?.activityListTableViewProtocols(delegate: self, dataSource: self)
        navigationItem.title = "Finance App 💰"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.fetchActivityData()
        service.fetchHomeData { homeData in

            guard let homeData = homeData else {
                return
            }

            let configuration = HomeViewConfiguration(homeData: homeData)

            DispatchQueue.main.async {

                self.homeView.updateView(with: configuration)
            }
        }
    }
    
    func fetchActivityData() {
        service.fetchHomeData { data in
            guard let data = data else {return}
            self.ActivityData = data.activity
            DispatchQueue.main.async {
                self.activityListView?.activity.stopAnimating()
                self.activityListView?.activityListTableView.reloadData()
            }
        }
    }
    

    override func loadView() {
        activityListView = ActivityListView()
        self.view = activityListView
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ActivityData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ActivityCellView? = tableView.dequeueReusableCell(withIdentifier: ActivityCellView.identifier, for: indexPath) as? ActivityCellView
        let index = ActivityData[indexPath.row]
        cell?.storeLabel.text = index.name
        cell?.valueLabel.text = "$\(index.price) • \(index.time)"
    
        if index.name == "Mall" {
            cell?.iconImageView.tintColor = .systemPurple
            cell?.iconImageView.image = UIImage(imageLiteralResourceName: "bag.circle.fill")
        } else if index.name == "Food Court" {
            cell?.iconImageView.tintColor = .systemCyan
            cell?.iconImageView.image = UIImage(imageLiteralResourceName: "fork.knife.circle.fill")
        } else if index.name == "Oceanic Airlines" {
            cell?.iconImageView.tintColor = .systemOrange
            cell?.iconImageView.image = UIImage(imageLiteralResourceName: "airplane.circle.fill")
        } else if index.name == "Gym Membership" {
            cell?.iconImageView.tintColor = .systemRed
            cell?.iconImageView.image = UIImage(imageLiteralResourceName: "heart.circle.fill")
        } else if index.name == "Private Transport" {
            cell?.iconImageView.tintColor = .systemGreen
            cell?.iconImageView.image = UIImage(imageLiteralResourceName: "car.circle.fill")
        }
        
        cell?.accessoryType = .disclosureIndicator
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Activity"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
}
