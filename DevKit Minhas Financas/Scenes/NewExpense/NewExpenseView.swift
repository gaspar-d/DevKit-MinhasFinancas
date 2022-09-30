import UIKit

protocol NewExpenseViewProtocol: AnyObject {
	
}

final class NewExpenseView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension NewExpenseView: NewExpenseViewProtocol {
	
}

extension NewExpenseView: ViewCode {
	func setupComponents() {
		
	}
	
	func setupConstraints() {
		
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .systemRed
	}
	
	
}
