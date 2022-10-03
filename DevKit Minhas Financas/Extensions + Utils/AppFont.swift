import UIKit

// TODO: - Make this thing work
// FIXME: - I need to change everything by default, not changing one by one.

struct AppFontName {
	static let regular = "Roboto-Regular"
//	static let regular = "GemunuLibre-Regular"
//	static let bold = "GemunuLibre-Regular"
	static let bold = "Roboto-Bold"
}

extension UIFontDescriptor.AttributeName {
	static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
	static var isOverride: Bool = false
	
	@objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
		return UIFont(name: AppFontName.regular, size: size)!
	}
	
	@objc class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
		return UIFont(name: AppFontName.bold, size: size)!
	}
	
	@objc convenience init(myCoder aDecoder: NSCoder) {
		guard let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
			  let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
			self.init(myCoder: aDecoder)
			return
		}
		
		var fontName = ""
		switch fontAttribute {
		case "CTFontRegularUsage":
			fontName = AppFontName.regular
		case "CTFontEmphasizedUsage", "CTFontBoldUsage":
			fontName = AppFontName.bold
		default:
			fontName = AppFontName.regular
		}
		self.init(name: fontName, size: fontDescriptor.pointSize)!
	}
	
	class func overrideInitialize() {
		guard self == UIFont.self, !isOverride else { return }
		
		// Avoid method swizzling run twice and revert to original initialize function
		isOverride = true
		
		if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
		   let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:))) {
			method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
		}
		
		if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
		   let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:))) {
			method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
		}
		
		if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))), // Trick to get over the lack of UIFont.init(coder:))
		   let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
			method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
		}
	}
}
