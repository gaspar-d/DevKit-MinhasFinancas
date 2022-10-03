import UIKit

final class DefaultTextField: UITextField {
	
	init(withNumericValue text: String) {
		super.init(frame: .zero)
		initMainTextField(with: text)
	}
	
	init(withPlaceholder placeholder: String, keyboardType: UIKeyboardType = .default) {
		super.init(frame: .zero)
		initSecondaryTextField(with: placeholder, keyboardType: keyboardType)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func initMainTextField(with text: String) {
		self.translatesAutoresizingMaskIntoConstraints = false
		self.text = text
		self.textColor  = .ColorAssets.primaryColor
		self.font = .systemFont(ofSize: 32, weight: .bold)
		self.borderStyle = .roundedRect
		self.borderStyle = .none
	}
	
	private func initSecondaryTextField(with placeholder: String, keyboardType: UIKeyboardType) {
		self.translatesAutoresizingMaskIntoConstraints = false
		self.placeholder = placeholder
		self.textColor  = .ColorAssets.primaryColor
		self.font = .systemFont(ofSize: 16, weight: .regular)
		self.borderStyle = .roundedRect
		self.keyboardType = keyboardType
	}
}


