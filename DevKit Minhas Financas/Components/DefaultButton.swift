import UIKit

final class DefaultButton: UIButton {
	
	init(title: String, icon: String, color: UIColor) {
		super.init(frame: .zero)
		
		initCTAButton(title: title, icon: icon, color: color)
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
	
		self.configuration = configuration
	}
}


