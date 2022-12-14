import UIKit

final class ActivityDetailsViewController: UIViewController {

    // MARK: - Life Cycle
    
    override func loadView() {
        view = ActivityDetailsView(viewModel: ActivityDetailsViewModel(image: UIImage(named: "mall"),
                                                                       name: "Mall",
                                                                       category: "Shopping",
                                                                       value: "$1000.0",
                                                                       purchaseTime: "8:40"))
    }
}
