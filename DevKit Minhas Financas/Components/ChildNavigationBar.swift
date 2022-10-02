import UIKit

//final class CustomNavBar: UINavigationController {
//
//	func setCustomNavBar(title: String, delegate: UINavigationControllerDelegate) -> UINavigationBarAppearance {
//		let custom = UINavigationBarAppearance()
//		custom.backgroundColor = .systemBackground
//		custom.titleTextAttributes = [.foregroundColor: UIColor.label.cgColor]
//		custom.largeTitleTextAttributes = [.foregroundColor: UIColor.label.cgColor]
//
//		navigationBar.prefersLargeTitles = true
//		navigationItem.scrollEdgeAppearance = custom
//		navigationItem.standardAppearance = custom
//		navigationItem.compactAppearance = custom
//		navigationItem.title = title
//		navigationController?.delegate = delegate
//		return custom
//	}
//}
//
//import UIKit

class CustomNavBar: UINavigationController {

//	lazy var customNavBar: UINavigationBarAppearance = {
//		let custom = UINavigationBarAppearance()
//		custom.backgroundColor = .systemBackground
//		custom.titleTextAttributes = [.foregroundColor: UIColor.label.cgColor]
//		custom.largeTitleTextAttributes = [.foregroundColor: UIColor.label.cgColor]
//
//		return custom
//	}()
//
//	func setCustomNavBar() -> UINavigationBarAppearance {
//		return customNavBar
//	}
	
	func setupNavigationBarAppearance(title: String) {
		let appearance = UINavigationBarAppearance()
		appearance.backgroundColor = .systemBackground
		
		navigationItem.title = title
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.navigationBar.scrollEdgeAppearance = appearance
		navigationController?.navigationBar.tintColor = .secondaryLabel
	}
}

//navigationItem.title = <#Title#>
//navigationItem.standardAppearance = navBar.setCustomNavBar()
//navigationItem.scrollEdgeAppearance = navBar.setCustomNavBar()

