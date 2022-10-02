import UIKit

final class NewExpenseController: UIViewController {
	
	private let customView: NewExpenseViewProtocol?
	weak var coordinator: Coordinator?
	
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
		setupNavigationBarAppearance()
		setupRightBarButton()
		setupLeftBarButton()
//		validateInputField()
	}
	
	private func setupView() {
		self.view = customView as? UIView
	}
	
	private func setupNavigationBarAppearance() {
		let appearance = UINavigationBarAppearance()
		appearance.backgroundColor = .systemBackground

		navigationItem.title = "Nova Despesa"
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
		validateInputField()
	}
	
	private func validateInputField() {
		guard let name = customView?.getNameText,
			  let value = customView?.getValueText
		else {
			print("Campo vazio")
			return
		}
		
		if name.isEmpty || value.isEmpty {
			print("Faltou preencher")
		} else {
			print("Esse é o \(name) com valor: \(value)")
		}
	}
}
