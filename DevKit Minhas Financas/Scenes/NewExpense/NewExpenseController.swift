import UIKit

final class NewExpenseController: UIViewController {
	
	private let customView: NewExpenseViewProtocol?
	var coordinator: Coordinator?
	
	init(customView: NewExpenseViewProtocol = NewExpenseView()) {
		self.customView = customView
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
	}
	
	
	private func setupView() {
		self.view = customView as? UIView
		
		title = "Nova Despesa"
	}
}
