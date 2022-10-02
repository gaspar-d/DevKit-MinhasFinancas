import UIKit

protocol HomeCoordinatorProtocol: AnyObject {
	func navigateToExpenseView()
	func navigateToIncomeView()
}

final class HomeCoordinator: Coordinator {
	var navigation: UINavigationController
	
	init(navigation: UINavigationController) {
		self.navigation = navigation
	}
	
	func start() {
		let vc = HomeController()
		vc.coordinator = self
		navigation.show(vc, sender: self)
	}
}

extension HomeCoordinator: HomeCoordinatorProtocol {
	
	func navigateToExpenseView() {
		let expenseVC = NewExpenseController()
		let navBar = UINavigationController(rootViewController: expenseVC)
		expenseVC.coordinator = self
		navigation.present(navBar, animated: true)
	}
	
	func navigateToIncomeView() {
		let incomeVC = NewIncomeController()
		let navBar = UINavigationController(rootViewController: incomeVC)
		incomeVC.coordinator = self
		navigation.present(navBar, animated: true)
	}
}

