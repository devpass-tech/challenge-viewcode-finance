import UIKit

final class ActivityDetailsView: UIView {
    
    // MARK: - Private Properties UI
    
    private lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private lazy var productView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var productValueView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var categoryNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var productValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var purchaseTime: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var reportButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 14
        button.backgroundColor = .systemBlue
        button.setTitle("Report a issue", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let viewModel: ActivityDetailsViewModel
    
    // MARK: - Init
    
    init(viewModel: ActivityDetailsViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        setupHierarchy()
        setupConstraints()
        setupExtra()
    }
    
    private func setupHierarchy() {
        addSubview(mainStack)
        mainStack.addArrangedSubview(productView)
        productView.addSubview(productImage)
        productView.addSubview(productNameLabel)
        productView.addSubview(categoryNameLabel)
        
        mainStack.addArrangedSubview(productValueView)
        productValueView.addSubview(productValue)
        productValueView.addSubview(purchaseTime)
        
        addSubview(reportButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: reportButton.topAnchor, constant: -50),
            
            productImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            productNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            productNameLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 8),
            
            categoryNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryNameLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 8),
            
            productValue.centerXAnchor.constraint(equalTo: centerXAnchor),
            purchaseTime.centerXAnchor.constraint(equalTo: centerXAnchor),
            purchaseTime.topAnchor.constraint(equalTo: productValue.bottomAnchor, constant: 8),
            
            reportButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            reportButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -15),
            reportButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            reportButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func setupExtra() {
        backgroundColor = .systemBackground
        productImage.image = viewModel.image
        productNameLabel.text = viewModel.name
        categoryNameLabel.text = viewModel.category
        productValue.text = viewModel.value
        purchaseTime.text = viewModel.purchaseTime
    }
}
