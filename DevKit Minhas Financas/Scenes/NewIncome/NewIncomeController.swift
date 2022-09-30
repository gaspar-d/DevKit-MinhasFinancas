import UIKit

final class NewIncomeController: UIViewController {
	
	private let customView: NewIncomeViewProtocol?
	
	init(customView: NewIncomeViewProtocol = NewIncomeView()) {
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
		
		title = "Nova Receita"
	}
}
