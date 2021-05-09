//  
//  AddProductViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation
import UIKit

protocol AddProductViewControllerProtocol: BaseViewControllerProtocol {
	func setCategory(_ category: ProductCategory)
	func imageAttached(text: String)
}

final class AddProductViewController: BaseViewController {
	
	// MARK: VIPER Dependencies
	var presenter: AddProductPresenterProtocol? { return super.basePresenter as? AddProductPresenterProtocol }
		
	// MARK: IBOutlets declaration of all controls
	@IBOutlet weak var categoryLabel: UILabel!
	@IBOutlet weak var categoryImageView: UIImageView!
	@IBOutlet weak var categoryDescriptionLabel: UILabel!
	@IBOutlet weak var categoryButton: UIButton!
	@IBOutlet weak var modelLabel: UILabel!
	@IBOutlet weak var modelTextField: UITextField!
	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var priceTextField: UITextField!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var descriptionTextView: UITextView!
	@IBOutlet weak var attachImageButton: UIButton!
	@IBOutlet weak var attachImageLabel: UILabel!
	@IBOutlet weak var addProductButton: UIButton!
	
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
	var imagePicker: ImagePicker!
	
	// MARK: UIViewController Functions
	override func viewDidLoad() {
		super.viewDidLoad()

		self.setNavigationBar()
		
		self.imagePicker = ImagePicker(presentationController: self, delegate: self)
	}
	
	override func initializeUI() {
		self.priceTextField.keyboardType = .decimalPad
		self.attachImageButton.roundedByDefault()
		self.addProductButton.roundedByDefault()
	}
	
	// MARK: IBActions declaration of all the controls
	@IBAction func chooseCategoryButtonPressed(_ sender: Any) {
		self.presenter?.chooseCategoryButtonPressed()
	}
	
	@IBAction func attachImageButtonPressed(_ sender: Any) {
		guard let button = sender as? UIButton else { return }
		self.imagePicker.present(from: button)
	}
	
	@IBAction func addProductButtonPressed(_ sender: Any) {
		self.presenter?.addProductButtonPressed(model: self.modelTextField.text ?? "", price: self.priceTextField.text ?? "", description: self.descriptionTextView.text)
	}
	
	// MARK: Private Functions
	func setNavigationBar() {
		self.navigationBarManager?.configureNavigationBar(model: NavigationBarModel(title: self.title))
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension AddProductViewController: AddProductViewControllerProtocol {
	
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? AddProductViewModel else { return }
		self.title = model.screenTitle
		
		self.categoryLabel.text = model.categoryTitle
		self.categoryImageView.image = UIImage(named: model.categoryImage)
		self.categoryDescriptionLabel.text = model.categoryDescription
		self.categoryButton.setTitle(model.categoryButtonTitle, for: .normal)
		self.modelLabel.text = model.modelTitle
		self.priceLabel.text = model.priceTitle
		self.descriptionLabel.text = model.descriptionTitle
		self.attachImageButton.setTitle(model.attachImageButtonTitle, for: .normal)
		self.attachImageLabel.text = model.nonAttachedImage
		self.addProductButton.setTitle(model.addProductButtonTitle, for: .normal)
	}
	
	func setCategory(_ category: ProductCategory) {
		self.categoryDescriptionLabel.text = category.getLocalizedString()
		self.categoryImageView.image = category.getAssociatedImage()
	}
	
	func imageAttached(text: String) {
		self.attachImageLabel.text = text
	}
}

extension AddProductViewController: ImagePickerDelegate {

	func didSelect(image: UIImage?) {
		self.presenter?.imageSelected(imageEncoded: Utils.imgBase64Encoding(image ?? UIImage()))
	}
}
