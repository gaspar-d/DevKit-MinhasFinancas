import UIKit

final class NewIncomeController: UIViewController {
	
	private let customView: NewIncomeViewProtocol?
	weak var coordinator: Coordinator?
	
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
		setupNavigationBarAppearance()
		setupRightBarButton()
		setupLeftBarButton()
	}
	
	
	private func setupView() {
		self.view = customView as? UIView
	}
	
	private func setupNavigationBarAppearance() {
		let appearance = UINavigationBarAppearance()
		appearance.backgroundColor = .systemBackground
		
		navigationItem.title = "Nova Receita"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.navigationBar.scrollEdgeAppearance = appearance
		navigationController?.navigationBar.standardAppearance = appearance
		navigationController?.navigationBar.compactAppearance = appearance
		navigationController?.navigationBar.compactScrollEdgeAppearance = appearance
		navigationController?.navigationBar.tintColor = .secondaryLabel
		
	}
	
	private func setupRightBarButton() {
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar",
															style: .plain,
															target: self,
															action: #selector(didTapSaveButton))
	}
	
	private func setupLeftBarButton() {
		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.down"),
														   style: .plain,
														   target: self,
														   action: #selector(didTapDismissButton))
	}
	
	@objc func didTapDismissButton() {
		print("Dismiss button tapped")
	}
	
	@objc func didTapSaveButton() {
		print("Save button tapped")
	}
}
