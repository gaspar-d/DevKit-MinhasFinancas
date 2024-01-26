import UIKit

final class ModalController: UIViewController {

	// MARK: -  Variables
	
	let categoryItems = ["", "Novo Carro", "TV", "Férias nas Maldivas", "Nenhum"]
	private let customView: ModalViewProtocol?
	private let validator: ValidatorProtocol
	private let alert: AlertsProtocol
	weak var coordinator: Coordinator?
	
	init(customView: ModalViewProtocol = ModalView(),
		 validator: ValidatorProtocol = Validator(),
		 alert: AlertsProtocol = Alerts()
	) {
		self.customView = customView
		self.validator = validator
		self.alert = alert
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
		setupPickerDelegateAndDataSource()
		setPresentControllerDelegate()
		disableModalDragDownDismiss()
	}
	
	// MARK: - Methods
	
	private func setupView() {
		self.view = customView as? UIView
	}
	
	public func chooseWhichViewAppear() {
		customView?.isNewExpenseView()
	}
	
	private func setPresentControllerDelegate() {
		navigationController?.presentationController?.delegate = self
	}
	
	private func disableModalDragDownDismiss() {
		self.isModalInPresentation = true
	}
	
	private func setupPickerDelegateAndDataSource() {
		customView?.setPickerDelegateAndSource(delegate: self,
											   datasource: self)
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
		navigationItem.rightBarButtonItem = UIBarButtonItem(
			title: "Salvar",
			style: .plain,
			target: self,
			action: #selector(didTapSaveButton))
	}
	
	private func setupLeftBarButton() {
		navigationItem.leftBarButtonItem = UIBarButtonItem(
			image: UIImage(systemName: "chevron.down"),
			style: .plain,
			target: self,
			action: #selector(didTapDismissButton))
	}
	
	@objc func didTapDismissButton() {
		alert.confirmPopup(title: "Deseja Cancelar?",
						   message: "",
						   controller: self)
	}
	
	@objc func didTapSaveButton() {
		guard let name = customView?.getNameText,
			  let value = customView?.getValueText
		else {
			return
		}
		
		if validator.isInputValid(withName: name, withValue: value) {
			alert.popup(title: "Campo Vazio",
						message: "Por favor preencher todos os campos",
						controller: self)
		} else {
			alert.popup(title: "Salvo",
						message: "",
						controller: self)
			customView?.cleanFields()
		}
	}
}


// MARK: -  Extensions

extension ModalController: UIPickerViewDelegate, UIPickerViewDataSource {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return categoryItems.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return categoryItems[row]
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		customView?.setCategory(item: categoryItems[row])
	}
}

extension ModalController: UIAdaptivePresentationControllerDelegate {
	
	func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
			alert.confirmPopup(title: "Deseja Cancelar?",
							   message: "",
							   controller: self)
	}
}
