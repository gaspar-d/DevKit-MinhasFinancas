import UIKit

protocol ValidatorProtocol: AnyObject {
	func isInputValid(withName name: String, withValue value: String) -> Bool
}

final class Validator {}

extension Validator: ValidatorProtocol {
	
	public func isInputValid(withName name: String, withValue value: String) -> Bool {
		if name.isEmpty || value.isEmpty {
			return true
		}
		return false
	}
}

