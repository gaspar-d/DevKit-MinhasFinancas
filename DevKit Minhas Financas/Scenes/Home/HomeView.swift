import UIKit

protocol HomeViewProtocol: AnyObject {
	func setAddIncomeButtonAction(target: Any?, action: Selector)
	func setAddExpenseButtonAction(target: Any?, action: Selector)
}

final class HomeView: UIView {
	
	// MARK: - Balance Components
	
	private lazy var balanceContainerStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [myBalanceLabel,
												   inputTextField,
												   bottomInputLine,
												   lastTransitionLabel])
		
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.backgroundColor = .systemBackground
		stack.axis = .vertical
		stack.spacing = 10
		stack.layer.cornerRadius = 5
		stack.isLayoutMarginsRelativeArrangement = true
		stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 18, bottom: 12, trailing: 18)
		
		return stack
	}()
	
	private lazy var myBalanceLabel: UILabel = {
		let label = UILabel()
		label.text = "Meu Saldo"
		label.textColor  = .secondaryLabel
		label.font = .systemFont(ofSize: 12, weight: .bold)
		
		return label
	}()
	
	private lazy var inputTextField: UITextField = {
		let text = UITextField()
		text.placeholder = "R$  0,00"
		text.textColor  = .label
		text.font = .systemFont(ofSize: 32, weight: .bold)
		
		return text
	}()
	
	private lazy var bottomInputLine: UIView = {
		let view = UIView()
		view.backgroundColor = .systemIndigo
		
		return view
	}()
	
	private lazy var lastTransitionLabel: UILabel = {
		let label = UILabel()
		label.text = "Última atualização                09:41"
		label.textColor  = .secondaryLabel
		label.font = .systemFont(ofSize: 12, weight: .regular)
		
		
		return label
	}()
	
	// MARK: - Button Components
	
	private lazy var buttonsAddContainerStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [addIncomeButton,
												  addExpenseButton])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.backgroundColor = .systemBackground
		stack.axis = .horizontal
		stack.distribution = .fillEqually
		stack.spacing = 8
		
		return stack
	}()
	
	private lazy var addIncomeButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.baseBackgroundColor = .systemGreen
		configuration.baseForegroundColor = .systemBackground
		configuration.buttonSize = .large
		configuration.cornerStyle = .small
		
		var container = AttributeContainer()
		configuration.attributedTitle = AttributedString("Nova Receita", attributes: container)
		let button = UIButton(configuration: configuration)
		
		return button
	}()
	
	private lazy var addExpenseButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.baseBackgroundColor = .systemRed
		configuration.baseForegroundColor = .systemBackground
		configuration.buttonSize = .large
		configuration.cornerStyle = .small
		
		var container = AttributeContainer()
		configuration.attributedTitle = AttributedString("Nova Receita", attributes: container)
		let button = UIButton(configuration: configuration)
		
		return button
	}()
	
	// MARK: - Budget Components
	
	private lazy var budgetContainerStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [budgetTitleLabel,
												   addNewItemButton,
												   titleUnderLine,
												   separatorLineOne,
												   separatorLineTwo])
		
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.backgroundColor = .systemBackground
		stack.axis = .vertical
		stack.spacing = 10
		stack.layer.cornerRadius = 5
		stack.isLayoutMarginsRelativeArrangement = true
		stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 18, bottom: 12, trailing: 18)
		
		return stack
	}()
	
	private lazy var budgetTitleLabel: UILabel = {
		let label = UILabel()
		label.text = "Orçamento"
		label.textColor  = .label
		label.font = .systemFont(ofSize: 22, weight: .bold)
		
		return label
	}()
	
	private lazy var addNewItemButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.baseBackgroundColor = .systemRed
		configuration.baseForegroundColor = .systemBackground
		configuration.buttonSize = .large
		configuration.cornerStyle = .small
		configuration.image = UIImage(systemName: "plus")
		
		var container = AttributeContainer()
		configuration.attributedTitle = AttributedString("Nova Receita", attributes: container)
		let button = UIButton(configuration: configuration)
		
		return button
	}()
	
	private lazy var titleUnderLine: UIView = {
		let view = UIView()
		view.backgroundColor = .secondarySystemBackground
		
		return view
	}()
	
	private lazy var separatorLineOne: UIView = {
		let view = UIView()
		view.backgroundColor = .systemIndigo
		
		return view
	}()
	
	private lazy var separatorLineTwo: UIView = {
		let view = UIView()
		view.backgroundColor = .systemIndigo
		
		return view
	}()
	
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Extensions

extension HomeView: HomeViewProtocol {
	
	func setAddIncomeButtonAction(target: Any?, action: Selector) {
		addIncomeButton.addTarget(target, action: action, for: .touchUpInside)
	}
	
	func setAddExpenseButtonAction(target: Any?, action: Selector) {
		addExpenseButton.addTarget(target, action: action, for: .touchUpInside)
	}
}

// MARK: - Constraints

extension HomeView: ViewCode {
	func setupComponents() {
		addSubview(balanceContainerStack)
		addSubview(buttonsAddContainerStack)
		addSubview(budgetContainerStack)
	}
	
	func setupConstraints() {
		let verticalPadding: CGFloat = 12
		let screenBorderMargin: CGFloat = 16
		
		NSLayoutConstraint.activate([
			balanceContainerStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
			balanceContainerStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenBorderMargin),
			balanceContainerStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -screenBorderMargin),
			
			bottomInputLine.heightAnchor.constraint(equalToConstant: 1),
			
			buttonsAddContainerStack.topAnchor.constraint(equalTo: balanceContainerStack.bottomAnchor, constant: verticalPadding),
			buttonsAddContainerStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenBorderMargin),
			buttonsAddContainerStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -screenBorderMargin),
			
			budgetContainerStack.topAnchor.constraint(equalTo: buttonsAddContainerStack.bottomAnchor, constant: 20),
			budgetContainerStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenBorderMargin),
			budgetContainerStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -screenBorderMargin),
			
			titleUnderLine.heightAnchor.constraint(equalToConstant: 3),
			separatorLineOne.heightAnchor.constraint(equalToConstant: 1),
			separatorLineTwo.heightAnchor.constraint(equalToConstant: 1),
			
		])
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .secondarySystemBackground
	}
}
