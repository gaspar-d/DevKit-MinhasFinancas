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
		let expenseVC = ModalController()
		expenseVC.coordinator = self
		expenseVC.chooseWhichViewAppear()
		let navBar = UINavigationController(rootViewController: expenseVC)
		navigation.present(navBar, animated: true)
	}
	
	func navigateToIncomeView() {
		let incomeVC = ModalController()
		incomeVC.coordinator = self
		let navBar = UINavigationController(rootViewController: incomeVC)
		navigation.present(navBar, animated: true)
	}
}

