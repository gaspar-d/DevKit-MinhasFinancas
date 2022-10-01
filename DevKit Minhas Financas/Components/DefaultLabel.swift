import UIKit

final class DefaultLabel: UILabel {
	
	init() {
		super.init(frame: .zero)
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("Can't find storyboard")
	}
	
	private func initLabel() {
		self.text = text
		self.textColor = color
		self.font = .systemFont(ofSize: <#T##CGFloat#>, weight: <#T##UIFont.Weight#>)
	}
}
