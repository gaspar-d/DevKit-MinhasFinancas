import UIKit

protocol HomeViewProtocol: AnyObject {
	
}

final class HomeView: UIView {
	
	private lazy var separatorLine: UIView = {
		let view = UIView()
		view.backgroundColor = .systemBlue
		
		return view
	}()
	
	// MARK: - Balance Components
	
	private lazy var balanceContainerStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [myBalanceLabel,
												   inputTextField,
												   separatorLine,
												   lastTransitionLabel])
		
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.backgroundColor = .systemBackground
		stack.axis = .vertical
		
		return stack
	}()
	
	private lazy var myBalanceLabel: UILabel = {
		let label = UILabel()
		label.text = "Meu Saldo"
		label.textColor  = .secondaryLabel
		
		return label
	}()
	
	private lazy var inputTextField: UITextField = {
		let text = UITextField()
		text.placeholder = "R$  0,00"
		text.textColor  = .label
		
		return text
	}()
	
	private lazy var lastTransitionLabel: UILabel = {
		let label = UILabel()
		label.text = "Última atualização   09:41"
		label.textColor  = .secondaryLabel
		
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
	
	
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

extension HomeView: HomeViewProtocol {
	
}

// MARK: - Constraints

extension HomeView: ViewCode {
	func setupComponents() {
		addSubview(balanceContainerStack)
		balanceContainerStack.addSubview(separatorLine)
		addSubview(buttonsAddContainerStack)
	}
	
	func setupConstraints() {
		
		let verticalPadding: CGFloat = 12
		let screenBorderMargin: CGFloat = 16
		
		NSLayoutConstraint.activate([
			separatorLine.widthAnchor.constraint(equalTo: balanceContainerStack.widthAnchor,
												 multiplier: 0.8),
			separatorLine.heightAnchor.constraint(equalToConstant: 1),
			
			balanceContainerStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
													   constant: 20),
			balanceContainerStack.leadingAnchor.constraint(equalTo: leadingAnchor,
														   constant: screenBorderMargin),
			balanceContainerStack.trailingAnchor.constraint(equalTo: trailingAnchor,
															constant: -screenBorderMargin),
			
			buttonsAddContainerStack.topAnchor.constraint(equalTo: balanceContainerStack.bottomAnchor,
														  constant: verticalPadding),
			buttonsAddContainerStack.leadingAnchor.constraint(equalTo: leadingAnchor,
														   constant: screenBorderMargin),
			buttonsAddContainerStack.trailingAnchor.constraint(equalTo: trailingAnchor,
															constant: -screenBorderMargin),
			
		])
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .secondarySystemBackground
	}
}
