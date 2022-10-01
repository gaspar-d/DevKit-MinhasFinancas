import UIKit

protocol HomeViewProtocol: AnyObject {
	func setAddIncomeButtonAction(target: HomeController?, action: Selector)
	func setAddExpenseButtonAction(target: HomeController?, action: Selector)
}

final class HomeView: UIView {
	
	// MARK: - Balance Components
	
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
	
	private lazy var lastTransactionLabel: UILabel = {
		let label = UILabel()
		label.text = "Última atualização"
		label.textColor  = .secondaryLabel
		label.font = .systemFont(ofSize: 12, weight: .regular)
		
		return label
	}()
	
	private lazy var lastTransactionTime: UILabel = {
		let label = UILabel()
		label.text = "09:41"
		label.textColor  = .secondaryLabel
		label.font = .systemFont(ofSize: 12, weight: .regular)
		
		return label
	}()
	
	private lazy var balanceBottonContainer = DefaultStackView(basicStack: [lastTransactionLabel,
																			lastTransactionTime])
	
	private lazy var balanceContainerStack = DefaultStackView(defaultContainer:
																[myBalanceLabel,
																 inputTextField,
																 bottomInputLine,
																 balanceBottonContainer])
	
	// MARK: - Button Components
	
	private lazy var addIncomeButton = DefaultButton(title: "NOVA RECEITA",
													 icon: "plus",
													 color: .systemGreen)
	
	private lazy var addExpenseButton = DefaultButton(title: "NOVA DESPESA",
													  icon: "minus",
													  color: .systemRed)
	
	private lazy var buttonsAddContainerStack = DefaultStackView(buttonComponents:
																	[addIncomeButton,
																	 addExpenseButton])
	
	// MARK: - Budget Components -> Title Block
	
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
	
	private lazy var budgetTitleContainer = DefaultStackView(basicStack: [budgetTitleLabel, addNewItemButton])
	
	private lazy var titleUnderLine: UIView = {
		let view = UIView()
		view.backgroundColor = .secondarySystemBackground
		
		return view
	}()
	
	// MARK: - New Car Block
	
	private lazy var newCarLabel: UILabel = {
		let label = UILabel()
		label.text = "Novo Carro"
		label.textColor  = .label
		label.font = .systemFont(ofSize: 16, weight: .bold)
		
		return label
	}()
	
	private lazy var carCompletionBar: UIView = {
		let view = UIView()
		view.backgroundColor = .systemIndigo
		view.layer.cornerRadius = 3
		
		return view
	}()
	
	private lazy var currentValueLabel: UILabel = {
		let label = UILabel()
		label.text = "R$ 2.000,00"
		label.textColor  = .systemRed
		label.font = .systemFont(ofSize: 12, weight: .bold)
		
		return label
	}()
	
	private lazy var totalValueLabel: UILabel = {
		let label = UILabel()
		label.text = "R$ 80.000,00"
		label.textColor  = UIColor.init(red: 77/255, green: 92/255, blue: 228/255, alpha: 1)
		label.font = .systemFont(ofSize: 12, weight: .bold)
		
		return label
	}()
	
	private lazy var separatorLineOne: UIView = {
		let view = UIView()
		view.backgroundColor = .secondarySystemBackground
		
		return view
	}()
	
	private lazy var newCarBottonContainer = DefaultStackView(basicStack: [currentValueLabel,
																		   totalValueLabel])
	
	private lazy var newCarContainerStack = DefaultStackView(insideContainer:
																[newCarLabel,
																 carCompletionBar,
																 newCarBottonContainer])
	
	// MARK: - TV Block
	
	private lazy var newTvLabel: UILabel = {
		let label = UILabel()
		label.text = "TV"
		label.textColor  = .label
		label.font = .systemFont(ofSize: 16, weight: .bold)
		
		return label
	}()
	
	private lazy var tvCompletionBar: UIView = {
		let view = UIView()
		view.backgroundColor = .systemIndigo
		view.layer.cornerRadius = 3
		
		return view
	}()
	
	private lazy var tvCurrentValueLabel: UILabel = {
		let label = UILabel()
		label.text = "R$ 3.000,00"
		label.textColor  = .systemRed
		label.font = .systemFont(ofSize: 12, weight: .bold)
		
		return label
	}()
	
	private lazy var tvTotalValueLabel: UILabel = {
		let label = UILabel()
		label.text = "R$ 3.500,00"
		label.textColor  = UIColor.init(red: 77/255, green: 92/255, blue: 228/255, alpha: 1)
		label.font = .systemFont(ofSize: 12, weight: .bold)
		
		return label
	}()
	
	private lazy var newTvBottonContainer = DefaultStackView(basicStack: [tvCurrentValueLabel,
																		  tvTotalValueLabel])
	
	private lazy var newTvContainerStack = DefaultStackView(insideContainer:
																[newTvLabel,
																 tvCompletionBar,
																 newTvBottonContainer])
	
	
	
	private lazy var separatorLineTwo: UIView = {
		let view = UIView()
		view.backgroundColor = .secondarySystemBackground
		
		return view
	}()
	
	// MARK: - Maldivas Vacancy
	
	private lazy var vacancyLabel: UILabel = {
		let label = UILabel()
		label.text = "Férias nas Maldivas"
		label.textColor  = .label
		label.font = .systemFont(ofSize: 16, weight: .bold)
		
		return label
	}()
	
	private lazy var vacancyCompletionBar: UIView = {
		let view = UIView()
		view.backgroundColor = .systemIndigo
		view.layer.cornerRadius = 3
		
		return view
	}()
	
	private lazy var vacancyCurrentValueLabel: UILabel = {
		let label = UILabel()
		label.text = "R$ 1,50"
		label.textColor  = .systemRed
		label.font = .systemFont(ofSize: 12, weight: .bold)
		
		return label
	}()
	
	private lazy var vacancyTotalValueLabel: UILabel = {
		let label = UILabel()
		label.text = "R$ 200.000,00"
		label.textColor  = UIColor.init(red: 77/255, green: 92/255, blue: 228/255, alpha: 1)
		label.font = .systemFont(ofSize: 12, weight: .bold)
		
		return label
	}()
	
	private lazy var vacancyBottonContainer = DefaultStackView(basicStack: [vacancyCurrentValueLabel,
																			vacancyTotalValueLabel])
	
	private lazy var vacancyContainerStack = DefaultStackView(insideContainer:
																[vacancyLabel,
																 vacancyCompletionBar,
																 vacancyBottonContainer])
	
	private lazy var budgetContainerStack = DefaultStackView(defaultContainer:
																[budgetTitleContainer,
																 titleUnderLine,
																 newCarContainerStack,
																 separatorLineOne,
																 newTvContainerStack,
																 separatorLineTwo,
																 vacancyContainerStack])
	
	// MARK: - Suggestion Block
	
	private lazy var suggestionLabel: UILabel = {
		let label = UILabel()
		let imageIcon = NSTextAttachment()
		imageIcon.image = UIImage(systemName: "lightbulb.fill")?.withTintColor(.systemYellow)
		let fullLabel = NSMutableAttributedString(string: "")
		fullLabel.append(NSAttributedString(attachment: imageIcon))
		fullLabel.append(NSAttributedString(string: " Sugestão"))
		
		label.textColor  = .label
		label.textAlignment = .center
		label.textColor = UIColor.init(red: 77/255, green: 92/255, blue: 228/255, alpha: 1)
		label.font = .systemFont(ofSize: 16, weight: .bold)
		label.attributedText = fullLabel
		
		return label
	}()
	
	private lazy var suggestionText: UILabel = {
		let label = UILabel()
		label.text = "Crie seu orçamento para facilitar a visualização das metas"
		label.textColor  = .secondaryLabel
		label.textAlignment = .center
		label.numberOfLines = 0
		label.font = .systemFont(ofSize: 16, weight: .bold)
		
		return label
	}()
	
	//		private lazy var suggestionContainerStack = DefaultStackView(defaultContainer: [suggestionLabel, suggestionText])
	
	private lazy var suggestionContainerStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [suggestionLabel, suggestionText])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.backgroundColor = UIColor.init(red: 77/255, green: 92/255, blue: 228/255, alpha: 0.1)
		stack.axis = .vertical
		stack.spacing = 10
		stack.alignment = .center
		stack.layer.cornerRadius = 10
		stack.isLayoutMarginsRelativeArrangement = true
		stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 22, leading: 18, bottom: 22, trailing: 18)
		
		return stack
	}()
	
	// MARK: - Initializers
	
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
	
	func setAddIncomeButtonAction(target: HomeController?, action: Selector) {
		addIncomeButton.addTarget(target, action: action, for: .touchUpInside)
	}
	
	func setAddExpenseButtonAction(target: HomeController?, action: Selector) {
		addExpenseButton.addTarget(target, action: action, for: .touchUpInside)
	}
}

// MARK: - Constraints

extension HomeView: ViewCode {
	func setupComponents() {
		addSubview(balanceContainerStack)
		addSubview(buttonsAddContainerStack)
		addSubview(budgetContainerStack)
		addSubview(suggestionContainerStack)
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
			carCompletionBar.heightAnchor.constraint(equalToConstant: 6),
			tvCompletionBar.heightAnchor.constraint(equalToConstant: 6),
			vacancyCompletionBar.heightAnchor.constraint(equalToConstant: 6),
			separatorLineOne.heightAnchor.constraint(equalToConstant: 1),
			separatorLineTwo.heightAnchor.constraint(equalToConstant: 1),
			
			suggestionContainerStack.topAnchor.constraint(equalTo: budgetContainerStack.bottomAnchor, constant: 36),
			suggestionContainerStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenBorderMargin),
			suggestionContainerStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -screenBorderMargin),
			//			suggestionContainerStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: screenBorderMargin),
		])
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .secondarySystemBackground
	}
}
