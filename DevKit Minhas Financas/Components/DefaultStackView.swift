import UIKit

final class DefaultStackView: UIStackView {
	
	init(viewComponents: [UIView]) {
		super.init(frame: .zero)
		
		initDefaultContainer(stackComponents: viewComponents)
	}
	
	init(buttonComponents: [UIView]) {
		super.init(frame: .zero)
		
		initButtonContainer(stackComponents: buttonComponents)
	}
	
	init(basicStack: [UIView]) {
		super.init(frame: .zero)
		
		initBasicStack(stackComponents: basicStack)
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func initBasicStack(stackComponents: [UIView]) {
		stackComponents.forEach { self.addArrangedSubview($0) }
		self.translatesAutoresizingMaskIntoConstraints = false
		self.axis = .horizontal
		self.distribution = .equalSpacing
		self.spacing = 0
	}
	
	private func initDefaultContainer(stackComponents: [UIView]) {
		stackComponents.forEach { self.addArrangedSubview($0) }
		
		self.translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = .systemBackground
		self.axis = .vertical
		self.spacing = 10
		self.layer.cornerRadius = 5
		self.isLayoutMarginsRelativeArrangement = true
		self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 18, bottom: 12, trailing: 18)
	}
	
	private func initButtonContainer(stackComponents: [UIView]) {
		stackComponents.forEach { self.addArrangedSubview($0) }
		
		self.translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = .systemBackground
		self.axis = .horizontal
		self.distribution = .fillEqually
		self.spacing = 8
	}
}
