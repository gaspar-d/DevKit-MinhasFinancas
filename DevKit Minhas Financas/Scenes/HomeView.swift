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
	
	private lazy var addIncomeButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.baseBackgroundColor = .systemGreen
		configuration.baseForegroundColor = .label
		configuration.buttonSize = .large
		
		var container = AttributeContainer()
		
		configuration.attributedTitle = AttributedString("Nova Receita", attributes: container)
		
		let button = UIButton(configuration: configuration)
		button.translatesAutoresizingMaskIntoConstraints = false
		
		
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

extension HomeView: ViewCode {
	func setupComponents() {
		addSubview(balanceContainerStack)
		balanceContainerStack.addSubview(separatorLine)
		addSubview(addIncomeButton)
	}
	
	func setupConstraints() {
		
		let verticalPadding: CGFloat = 12
		let screenBorderMargin: CGFloat = 16
		
		NSLayoutConstraint.activate([
			separatorLine.widthAnchor.constraint(equalTo: balanceContainerStack.widthAnchor, multiplier: 0.8),
			separatorLine.heightAnchor.constraint(equalToConstant: 1),
			
			balanceContainerStack.centerYAnchor.constraint(equalTo: centerYAnchor),
			balanceContainerStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenBorderMargin),
			balanceContainerStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -screenBorderMargin),
			
			addIncomeButton.topAnchor.constraint(equalTo: balanceContainerStack.bottomAnchor, constant: verticalPadding)
		])
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .secondarySystemBackground
	}
}
