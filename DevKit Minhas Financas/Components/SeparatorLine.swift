import UIKit

final class SeparatorLine: UIView {
	
	init(withColor color: UIColor) {
		super.init(frame: .zero)
		createLine(color: color)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func createLine(color: UIColor) {
		self.backgroundColor = color
	}
}
