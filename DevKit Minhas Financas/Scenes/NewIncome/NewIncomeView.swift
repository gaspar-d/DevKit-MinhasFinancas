import UIKit

protocol NewIncomeViewProtocol: AnyObject {
	
}

final class NewIncomeView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

extension NewIncomeView: NewIncomeViewProtocol {
	
}

extension NewIncomeView: ViewCode {
	func setupComponents() {
		
	}
	
	func setupConstraints() {
		
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .systemGreen
	}
	
	
}
