import UIKit

extension UIColor {
	
	enum ColorAssets {
		static var textBlueAccentColor: UIColor { return UIColor.init(red: 77/255, green: 92/255, blue: 228/255, alpha: 1) }
		static var numberBlueAccentColor: UIColor { return UIColor.init(red: 77/255, green: 92/255, blue: 228/255, alpha: 0.7) }
		static var bgAccentColor: UIColor { return UIColor.init(red: 77/255, green: 92/255, blue: 228/255, alpha: 0.1) }
		static var customBlueLine: UIColor { return .systemIndigo }
		static var customRed: UIColor { return UIColor(red: 194/255, green: 76/255, blue: 67/255, alpha: 1) }
		static var customGreen: UIColor { return UIColor(red: 90/255, green: 173/255, blue: 51/255, alpha: 1) }
		
		static var primaryColor: UIColor { return .label }
		static var secondaryColor: UIColor { return .secondaryLabel }
		static var tertiaryColor: UIColor { return UIColor(red: 84/255, green: 86/255, blue: 92/255, alpha: 1) }
		static var fgColor: UIColor { return .systemBackground }
		static var bgColor: UIColor { return .secondarySystemBackground }
	}
}

