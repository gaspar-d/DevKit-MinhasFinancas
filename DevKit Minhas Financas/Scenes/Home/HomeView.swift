import UIKit

protocol HomeViewProtocol: AnyObject {
	func setAddIncomeButtonAction(target: HomeController?, action: Selector)
	func setAddExpenseButtonAction(target: HomeController?, action: Selector)
	func setLastTransaction(withHour hour: String)
}

final class HomeView: UIView {
	
	// MARK: - Balance Components
	
	private lazy var containerScroll: UIScrollView = {
		let view = UIScrollView(frame: .zero)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.showsVerticalScrollIndicator = false

		return view
	}()
	
	private lazy var myBalanceLabel = DefaultLabel(withText: "Meu Saldo", withColor: .ColorAssets.secondaryColor)
	private lazy var inputTextField = DefaultTextField(withNumericPlaceholder: "R$ 0,00")
	private lazy var bottomInputLine = SeparatorLine(withColor: .ColorAssets.customBlueLine)
	private lazy var lastTransactionLabel = DefaultLabel(withText: "Última atualização", withColor: .ColorAssets.secondaryColor, withFontWeight: .regular)
	private lazy var lastTransactionTime = DefaultLabel(withText: "09:41", withColor: .ColorAssets.secondaryColor, withFontWeight: .regular)
	private lazy var balanceBottonContainer = DefaultStackView(basicStack: [lastTransactionLabel, lastTransactionTime])
	private lazy var balanceContainerStack = DefaultStackView(defaultContainer:
																[myBalanceLabel,
																 inputTextField,
																 bottomInputLine,
																 balanceBottonContainer])
	
	
	// MARK: - Button Components
	
	private lazy var addIncomeButton = DefaultButton(withTitle: "NOVA RECEITA", withIcon: "plus", withColor: .ColorAssets.customGreen)
	private lazy var addExpenseButton = DefaultButton(withTitle: "NOVA DESPESA", withIcon: "minus", withColor: .ColorAssets.customRed)
	private lazy var buttonsAddContainerStack = DefaultStackView(buttonComponents:
																	[addIncomeButton,
																	 addExpenseButton])
	
	
	// MARK: - Budget Components -> Title Block
	
	private lazy var budgetTitleLabel = DefaultLabel(withText: "Orçamento", withFontSize: 22)
	private lazy var addNewItemButton = DefaultButton(withIcon: "plus")
	private lazy var budgetTitleContainer = DefaultStackView(basicStack: [budgetTitleLabel, addNewItemButton])
	private lazy var titleUnderLine = SeparatorLine(withColor: .ColorAssets.bgColor)
	
	
	// MARK: - New Car Block
	
	private lazy var newCarLabel = DefaultLabel(withText: "Novo Carro", withFontSize: 16)
	private lazy var carCompletionBar = DefaultProgressBar(withProgress: 0.4)
	private lazy var currentValueLabel = DefaultLabel(withText: "R$ 2.000,00", withColor: .ColorAssets.customRed)
	private lazy var totalValueLabel = DefaultLabel(withText: "R$ 80.000,00", withColor: .ColorAssets.numberBlueAccentColor)
	private lazy var separatorLineOne = SeparatorLine(withColor: .ColorAssets.bgColor)
	private lazy var newCarBottonContainer = DefaultStackView(basicStack: [currentValueLabel, totalValueLabel])
	private lazy var newCarContainerStack = DefaultStackView(insideContainer:
																[newCarLabel,
																 carCompletionBar,
																 newCarBottonContainer])
	
	
	// MARK: - TV Block
	
	private lazy var newTvLabel = DefaultLabel(withText: "TV", withFontSize: 16)
	private lazy var tvCompletionBar = DefaultProgressBar(withProgress: 0.95)
	private lazy var tvCurrentValueLabel = DefaultLabel(withText: "R$ 3.000,00", withColor: .ColorAssets.customRed)
	private lazy var tvTotalValueLabel = DefaultLabel(withText: "R$ 3.500,00", withColor: .ColorAssets.numberBlueAccentColor)
	private lazy var separatorLineTwo = SeparatorLine(withColor: .ColorAssets.bgColor)
	private lazy var newTvBottonContainer = DefaultStackView(basicStack: [tvCurrentValueLabel, tvTotalValueLabel])
	private lazy var newTvContainerStack = DefaultStackView(insideContainer:
																[newTvLabel,
																 tvCompletionBar,
																 newTvBottonContainer])
	
	
	// MARK: - Maldivas Vacancy
	
	private lazy var vacancyLabel = DefaultLabel(withText: "Férias nas Maldivas", withFontSize: 16)
	private lazy var vacancyCompletionBar = DefaultProgressBar(withProgress: 0.01)
	private lazy var vacancyCurrentValueLabel = DefaultLabel(withText: "R$ 1,50", withColor: .ColorAssets.customRed)
	private lazy var vacancyTotalValueLabel = DefaultLabel(withText: "R$ 200.000,00", withColor: .ColorAssets.numberBlueAccentColor)
	private lazy var vacancyBottonContainer = DefaultStackView(basicStack: [vacancyCurrentValueLabel, vacancyTotalValueLabel])
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
		label.textColor = .ColorAssets.textBlueAccentColor
		label.font = .systemFont(ofSize: 16, weight: .bold)
		label.attributedText = fullLabel
		return label
	}()
	
	private lazy var suggestionText: UILabel = {
		let label = UILabel()
		label.text = "Crie seu orçamento para facilitar a visualização das metas"
		label.textColor  = .ColorAssets.tertiaryColor
		label.textAlignment = .center
		label.numberOfLines = 0
		label.font = .systemFont(ofSize: 16, weight: .bold)
		return label
	}()
	
	private lazy var suggestionContainerStack = DefaultStackView(
		defaultContainer: [suggestionLabel, suggestionText],
		withColor: .ColorAssets.bgAccentColor)
	
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
	
	func setLastTransaction(withHour hour: String) {
		lastTransactionTime.text = hour
	}
}

// MARK: - Constraints

extension HomeView: ViewCode {
	func setupComponents() {
		addSubview(containerScroll)
		
		containerScroll.addSubview(balanceContainerStack)
		containerScroll.addSubview(buttonsAddContainerStack)
		containerScroll.addSubview(budgetContainerStack)
		containerScroll.addSubview(suggestionContainerStack)
	}
	
	func setupConstraints() {
		let verticalPadding: CGFloat = 12
		let screenBorderMargin: CGFloat = 16
		let completionBarHeight: CGFloat = 6
		let separatorLineHeight: CGFloat = 1
		
		NSLayoutConstraint.activate([
			containerScroll.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			containerScroll.leadingAnchor.constraint(equalTo: leadingAnchor),
			containerScroll.trailingAnchor.constraint(equalTo: trailingAnchor),
			containerScroll.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			balanceContainerStack.topAnchor.constraint(equalTo: containerScroll.topAnchor, constant: 20),
			balanceContainerStack.leadingAnchor.constraint(equalTo: containerScroll.frameLayoutGuide.leadingAnchor, constant: screenBorderMargin),
			balanceContainerStack.trailingAnchor.constraint(equalTo: containerScroll.frameLayoutGuide.trailingAnchor, constant: -screenBorderMargin),

			titleUnderLine.heightAnchor.constraint(equalToConstant: 3),
			bottomInputLine.heightAnchor.constraint(equalToConstant: separatorLineHeight),
			separatorLineOne.heightAnchor.constraint(equalToConstant: separatorLineHeight),
			separatorLineTwo.heightAnchor.constraint(equalToConstant: separatorLineHeight),

			buttonsAddContainerStack.topAnchor.constraint(equalTo: balanceContainerStack.bottomAnchor, constant: verticalPadding),
			buttonsAddContainerStack.leadingAnchor.constraint(equalTo: containerScroll.frameLayoutGuide.leadingAnchor, constant: screenBorderMargin),
			buttonsAddContainerStack.trailingAnchor.constraint(equalTo: containerScroll.frameLayoutGuide.trailingAnchor, constant: -screenBorderMargin),

			budgetContainerStack.topAnchor.constraint(equalTo: buttonsAddContainerStack.bottomAnchor, constant: verticalPadding),
			budgetContainerStack.leadingAnchor.constraint(equalTo: containerScroll.frameLayoutGuide.leadingAnchor, constant: screenBorderMargin),
			budgetContainerStack.trailingAnchor.constraint(equalTo: containerScroll.frameLayoutGuide.trailingAnchor, constant: -screenBorderMargin),

			carCompletionBar.heightAnchor.constraint(equalToConstant: completionBarHeight),
			tvCompletionBar.heightAnchor.constraint(equalToConstant: completionBarHeight),
			vacancyCompletionBar.heightAnchor.constraint(equalToConstant: completionBarHeight),

			suggestionContainerStack.topAnchor.constraint(equalTo: budgetContainerStack.bottomAnchor, constant: 36),
			suggestionContainerStack.leadingAnchor.constraint(equalTo: containerScroll.frameLayoutGuide.leadingAnchor, constant: screenBorderMargin),
			suggestionContainerStack.trailingAnchor.constraint(equalTo: containerScroll.frameLayoutGuide.trailingAnchor, constant: -screenBorderMargin),
			suggestionContainerStack.bottomAnchor.constraint(equalTo: containerScroll.bottomAnchor),
		])
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .ColorAssets.bgColor
	}
}
