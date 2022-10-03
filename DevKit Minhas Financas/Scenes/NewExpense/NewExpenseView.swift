import UIKit

protocol NewExpenseViewProtocol: AnyObject {
	var getNameText: String? { get }
	var getValueText: String? { get }
	func cleanFields()
}

final class NewExpenseView: UIView {
	
	private lazy var nameTextField = DefaultTextField(withPlaceholder: "Nome")
	private lazy var valueTextField = DefaultTextField(withPlaceholder: "Valor", keyboardType: .numberPad)
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Extensions

extension NewExpenseView: NewExpenseViewProtocol {
	
	var getNameText: String? {
		return nameTextField.text
	}
	
	var getValueText: String? {
		return valueTextField.text
	}
	
	func cleanFields() {
		nameTextField.text = ""
		valueTextField.text = ""
	}
}

// MARK: - Constraints

extension NewExpenseView: ViewCode {
	func setupComponents() {
		addSubview(nameTextField)
		addSubview(valueTextField)
	}
	
	func setupConstraints() {
		textFieldAutoConstraints(component: nameTextField, topMargin: 33, reference: topAnchor, safeArea: true)
		textFieldAutoConstraints(component: valueTextField, topMargin: 12, reference: nameTextField.bottomAnchor, safeArea: false)
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .secondarySystemBackground
	}
	
	// TODO: - decouple this method
	func textFieldAutoConstraints(component: UIView, topMargin: CGFloat, reference: NSLayoutYAxisAnchor, safeArea: Bool) {
		let textFieldHeight: CGFloat = 44
		let screenBorderMargin: CGFloat = 16
		
		NSLayoutConstraint.activate([
			component.topAnchor.constraint(equalTo: safeArea ? safeAreaLayoutGuide.topAnchor : reference, constant: topMargin),
			component.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: screenBorderMargin),
			component.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -screenBorderMargin),
			component.heightAnchor.constraint(equalToConstant: textFieldHeight),
		])
	}
}
