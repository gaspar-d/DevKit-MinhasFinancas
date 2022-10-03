import UIKit

final class HomeController: UIViewController {

	private let customView: HomeViewProtocol?
	private let systemTime: SystemTime?
	var coordinator: HomeCoordinatorProtocol?
	
	init(customView: HomeViewProtocol? = HomeView(),
		 systemTime: SystemTime? = SystemTime()
	) {
		self.customView = customView
		self.systemTime = systemTime
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		setupNavigationBar()
		setupButtonsActions()
		setupLastTransactionTime()
	}
	
	private func setupView() {
		self.view = customView as? UIView
	}
	
	private func setupButtonsActions() {
		customView?.setAddIncomeButtonAction(target: self,
											 action: #selector(didTapIncomeButton))
		customView?.setAddExpenseButtonAction(target: self,
											  action: #selector(didTapExpenseButton))
	}
	
	@objc private func didTapIncomeButton() {
		coordinator?.navigateToIncomeView()
	}
	
	@objc private func didTapExpenseButton() {
		coordinator?.navigateToExpenseView()
	}
	
	private func setupLastTransactionTime() {
		guard let hour = systemTime?.hour else { return }
		customView?.setLastTransaction(withHour: hour)
	}
	
	private func setupNavigationBar() {
		title = "Minhas Finanças"
		let appearance = UINavigationBarAppearance()
		appearance.backgroundColor = .ColorAssets.fgColor
		navigationController?.navigationBar.scrollEdgeAppearance = appearance
	}
}

