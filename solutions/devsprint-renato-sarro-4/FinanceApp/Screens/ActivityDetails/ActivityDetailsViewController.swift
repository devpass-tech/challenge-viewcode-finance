//
//  ActivityDetailsViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ActivityDetailsViewController: UIViewController {
    
    var activityDetailView:ActivityDetailsView?

    override func loadView() {
        self.activityDetailView = ActivityDetailsView()
        self.view = self.activityDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
}

extension ActivityDetailsViewController:MallScreenProtocol{
    func actionIssueButton() {
        
    }
    
    func acitonBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
}
