import UIKit

final class DefaultButton: UIButton {
	
	init(withTitle title: String, withIcon icon: String, withColor color: UIColor) {
		super.init(frame: .zero)
		
		initCTAButton(title: title, icon: icon, color: color)
	}
	
	init(withIcon icon: String = "", withText text: String = "") {
		super.init(frame: .zero)
		
		initSystemButton(icon: icon, text: text)
	}
	
	required init?(coder: NSCoder) {
		fatalError("Can't find Storyboard")
	}
	
	private func initCTAButton(title: String, icon: String, color: UIColor) {
		let symbol = UIImage.SymbolConfiguration(weight: .bold)
		var configuration = UIButton.Configuration.filled()
		configuration.baseBackgroundColor = color
		configuration.baseForegroundColor = .systemBackground
		configuration.buttonSize = .large
		configuration.cornerStyle = .small
		configuration.image = UIImage(systemName: icon, withConfiguration: symbol)
		configuration.imagePlacement = .top
		configuration.imagePadding = 14
		
		var container = AttributeContainer()
		container.font = UIFont.boldSystemFont(ofSize: 10)
		configuration.attributedTitle = AttributedString(title, attributes: container)
	
		self.translatesAutoresizingMaskIntoConstraints = false
		self.configuration = configuration
	}
	
	private func initSystemButton(icon: String = "", text: String = "") {
		let symbol = UIImage.SymbolConfiguration(weight: .bold)
		let imageIcon = UIImage(systemName: icon, withConfiguration: symbol)
		self.setImage(imageIcon, for: .normal)
		self.setTitle(text, for: .normal)
		self.setTitleColor(.systemBlue, for: .normal)
		self.tintColor = .secondaryLabel
		self.translatesAutoresizingMaskIntoConstraints = false
	}
}

