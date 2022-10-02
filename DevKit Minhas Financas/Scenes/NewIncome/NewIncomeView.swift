import UIKit

protocol NewIncomeViewProtocol: AnyObject {
	
}

final class NewIncomeView: UIView {
	
	var nameTextField = DefaultTextField(withPlaceholder: "Nome")
	var valueTextField = DefaultTextField(withPlaceholder: "Valor", keyboardType: .numberPad)
	var categoryTextField = DefaultTextField(withPlaceholder: "Categoria")
	
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
		addSubview(nameTextField)
		addSubview(valueTextField)
		addSubview(categoryTextField)
	}
	
	func setupConstraints() {
		textFieldAutoConstraints(component: nameTextField, topMargin: 33, reference: topAnchor, safeArea: true)
		textFieldAutoConstraints(component: valueTextField, topMargin: 12, reference: nameTextField.bottomAnchor, safeArea: false)
		textFieldAutoConstraints(component: categoryTextField, topMargin: 12, reference: valueTextField.bottomAnchor, safeArea: false)
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .secondarySystemBackground
	}
	
	func textFieldAutoConstraints(component: UIView, topMargin: CGFloat, reference: NSLayoutYAxisAnchor, safeArea: Bool) {
		let textFieldHeight: CGFloat = 44
		let screenBorderMargin: CGFloat = 16
		
		NSLayoutConstraint.activate([
			component.topAnchor.constraint(equalTo:  safeArea ? safeAreaLayoutGuide.topAnchor : reference, constant: topMargin),
			component.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: screenBorderMargin),
			component.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -screenBorderMargin),
			component.heightAnchor.constraint(equalToConstant: textFieldHeight),
		])
	}
	
}
