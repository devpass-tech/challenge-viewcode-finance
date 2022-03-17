//
//  UserProfileViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class UserProfileViewController: UIViewController, ViewConfiguration {
    
    lazy var profileContent: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.spacing = 8
        stackview.translatesAutoresizingMaskIntoConstraints = false
        
        return stackview
    }()
    
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(imageLiteralResourceName: "ProfilePhoto")
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var profileName:UILabel = {
        let label = UILabel()
        label.text = "Irma Flores"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var profileInfo: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 3
        label.text = "Agency 0001\n Account 123456-7\n Devpass Bank"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserProfileCell")
        
        return tableView
    }()
    
    private var availableHeight: CGFloat = 0
    private let viewModel = UserProfileViewModel()
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        availableHeight = profileContent.frame.height + 32
        tableView.contentInset = UIEdgeInsets(top: availableHeight,
                                              left: 0,
                                              bottom: 0,
                                              right: 0)
    }
    
    //MARK: View Configuration
    func configViews() {
        view.backgroundColor = .systemGray6
    }
    
    func buildViews() {
        view.addSubviews([profileContent, tableView])
        profileContent.addArrangedSubviews([profileImage, profileName, profileInfo])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileContent.topAnchor.constraint(equalTo: view.topAnchor, constant: 44),
            profileContent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileContent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            profileImage.topAnchor.constraint(equalTo: profileContent.topAnchor),
            profileImage.centerXAnchor.constraint(equalTo: profileContent.centerXAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension UserProfileViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let alpha = -scrollView.contentOffset.y / availableHeight
        
        if alpha <= 1 {
            profileContent.alpha = alpha
        }
    }
    
    // MARK: Data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.listSections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.listSections[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listSections[section].itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "UserProfileCell")
        let config = viewModel.listSections[indexPath.section].itens[indexPath.row]
        
        cell.selectionStyle = .none
        
        cell.textLabel?.text = config.title
        cell.detailTextLabel?.text = config.detail
        
        if config.allowSelection {
            cell.accessoryType = .disclosureIndicator
        } else {
            cell.isUserInteractionEnabled = false
        }
        
        return cell
    }
}
