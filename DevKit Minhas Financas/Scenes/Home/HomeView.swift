import UIKit

protocol HomeViewProtocol: AnyObject {
	func setAddIncomeButtonAction(target: Any?, action: Selector)
	func setAddExpenseButtonAction(target: Any?, action: Selector)
}

final class HomeView: UIView {
	
	// MARK: - Balance Components
	
	private lazy var balanceContainerStack = DefaultStackView(viewComponents:
																[myBalanceLabel,
																 inputTextField,
																 bottomInputLine,
																 transitionBottonContainer])
	
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
	
	private lazy var transitionBottonContainer = DefaultStackView(basicStack: [lastTransitionLabel,
																			   lastTransitionTime])
	
	private lazy var lastTransitionLabel: UILabel = {
		let label = UILabel()
		label.text = "Última atualização"
		label.textColor  = .secondaryLabel
		label.font = .systemFont(ofSize: 12, weight: .regular)
		
		return label
	}()
	
	private lazy var lastTransitionTime: UILabel = {
		let label = UILabel()
		label.text = "09:41"
		label.textColor  = .secondaryLabel
		label.font = .systemFont(ofSize: 12, weight: .regular)
		
		return label
	}()
	
	// MARK: - Button Components
	
	private lazy var buttonsAddContainerStack = DefaultStackView(buttonComponents:
																	[addIncomeButton,
																	 addExpenseButton])
	
	private lazy var addIncomeButton = DefaultButton(title: "NOVA RECEITA",
													 icon: "plus",
													 color: .systemGreen)
	
	private lazy var addExpenseButton = DefaultButton(title: "NOVA DESPESA",
													  icon: "minus",
													  color: .systemRed)
	
	// MARK: - Budget Components
	
	private lazy var budgetContainerStack = DefaultStackView(viewComponents: [budgetTitleContainer,
																			  titleUnderLine,
																			  separatorLineOne,
																			  separatorLineTwo])
	
	private lazy var budgetTitleContainer = DefaultStackView(basicStack: [budgetTitleLabel, addNewItemButton])
	
	private lazy var budgetTitleLabel: UILabel = {
		let label = UILabel()
		label.text = "Orçamento"
		label.textColor  = .label
		label.font = .systemFont(ofSize: 22, weight: .bold)
		
		return label
	}()
	
	private lazy var addNewItemButton: UIButton = {
		var symbol = UIImage.SymbolConfiguration(weight: .bold)
		var imageIcon = UIImage(systemName: "plus", withConfiguration: symbol)
		
		let button = UIButton()
		button.setImage(imageIcon, for: .normal)
		button.tintColor = .secondaryLabel
		
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
			
			budgetContainerStack.topAnchor.constraint(equalTo: buttonsAddContainerStack.bottomAnchor, constant: verticalPadding),
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
