import UIKit

protocol HomeCoordinatorProtocol: AnyObject {
	func navigateToExpenseView()
	func navigateToIncomeView()
}

final class HomeCoordinator: Coordinator {
	var navigation: UINavigationController
	let expenseVC = NewExpenseController()
	let incomeVC = NewIncomeController()
	
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
		expenseVC.coordinator = self
		navigation.present(expenseVC, animated: true)
	}
	
	func navigateToIncomeView() {
		incomeVC.coordinator = self
		navigation.present(incomeVC, animated: true)
	}
}

