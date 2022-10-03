import UIKit

protocol NewIncomeViewProtocol: AnyObject {
	var getNameText: String? { get }
	var getValueText: String? { get }
	func setPickerDelegateAndSource(delegate: UIPickerViewDelegate, datasource: UIPickerViewDataSource)
	func setCategory(item: String)
	func cleanFields()
	func isNewExpenseView()
}

final class NewIncomeView: UIView {
	
	// MARK: - Components
	
	private lazy var nameTextField = DefaultTextField(withPlaceholder: "Nome")
	private lazy var valueTextField = DefaultTextField(withPlaceholder: "Valor", keyboardType: .numberPad)
	private lazy var categoryTextField = DefaultTextField(withPlaceholder: "Categoria")
	
	// TODO: - Need to consolidate this new code
	private lazy var categoryPicker: UIPickerView = {
		let view = UIPickerView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .ColorAssets.bgAccentColor
		return view
	}()
	
	private lazy var toolBar: UIToolbar = {
		let doneButton = UIBarButtonItem(title: "Ok", style: .done, target: self, action: #selector(self.okPicker))
		let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		let cancelButton = UIBarButtonItem(title: "Sair", style: .plain, target: self, action: #selector(self.dismissPicker))
		
		let toolBar = UIToolbar()
		toolBar.translatesAutoresizingMaskIntoConstraints = false
		toolBar.tintColor = .ColorAssets.customBlueLine
		toolBar.sizeToFit()
		toolBar.setItems([doneButton, spaceButton, cancelButton], animated: false)
		toolBar.isUserInteractionEnabled = true
		return toolBar
	}()
	
	
	// MARK: - Initializers
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc func okPicker() {
		categoryTextField.resignFirstResponder()
	}
	
	@objc func dismissPicker() {
		categoryTextField.text = ""
		categoryTextField.resignFirstResponder()
	}
}


// MARK: -  extensions

extension NewIncomeView: NewIncomeViewProtocol {
	var getNameText: String? {
		nameTextField.text
	}
	
	var getValueText: String? {
		valueTextField.text
	}
	
	func setPickerDelegateAndSource(delegate: UIPickerViewDelegate, datasource: UIPickerViewDataSource) {
		categoryPicker.delegate = delegate
		categoryPicker.dataSource = datasource
	}
	
	func setCategory(item: String) {
		categoryTextField.text = item
	}
	
	func cleanFields() {
		nameTextField.text = ""
		valueTextField.text = ""
		categoryTextField.text = ""
	}
	
	func isNewExpenseView() {
		categoryTextField.isHidden = true
	}
}

extension NewIncomeView: ViewCode {
	
	func setupComponents() {
		addSubview(nameTextField)
		addSubview(valueTextField)
		addSubview(categoryTextField)
		categoryTextField.inputView = categoryPicker
		categoryTextField.inputAccessoryView = toolBar
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
