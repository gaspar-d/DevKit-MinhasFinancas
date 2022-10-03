import UIKit

protocol AlertsProtocol: AnyObject {
	func popup(title: String, message: String, controller: UIViewController)
	func confirmPopup(title: String, message: String, controller: UIViewController)
}

final class Alerts {}

extension Alerts: AlertsProtocol {
	
	func popup(title: String, message: String, controller: UIViewController) {
		let alert = UIAlertController(title: title,
									  message: message,
									  preferredStyle: .actionSheet)
		
		let okAction = UIAlertAction(title: "Ok", style: .default)
		alert.addAction(okAction)
		
		controller.present(alert, animated: true)
	}
	
	func confirmPopup(title: String, message: String, controller: UIViewController) {
		
		let alert = UIAlertController(title: title,
									  message: message,
									  preferredStyle: .actionSheet)
		
		let yesAction = UIAlertAction(title: "sim", style: .destructive) {_ in 
			controller.dismiss(animated: true)
		}
		
		let noAction = UIAlertAction(title: "não", style: .cancel)
		
		alert.addAction(yesAction)
		alert.addAction(noAction)
		
		controller.present(alert, animated: true)
	}
}
