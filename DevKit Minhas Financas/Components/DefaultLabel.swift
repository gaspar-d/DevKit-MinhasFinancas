import UIKit

final class DefaultLabel: UILabel {
	
	init(withText text: String,
		 withColor color: UIColor = .ColorAssets.primaryColor,
		 withFontSize fontSize: CGFloat = 12,
		 withFontWeight fontWeight: UIFont.Weight = .bold)
	{
		super.init(frame: .zero)
		createLabel(text: text, color: color, fontSize: fontSize, fontWeight: fontWeight)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func createLabel(text: String, color: UIColor, fontSize: CGFloat, fontWeight: UIFont.Weight) {
		self.text = text
		self.textColor  = color
		self.font = .systemFont(ofSize: fontSize, weight: fontWeight)
	}
}
