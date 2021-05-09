//  
//  ProductDetailViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation
import UIKit

protocol ProductDetailViewControllerProtocol: BaseViewControllerProtocol {
	func setUpProductDetail(_ viewModel: ProductDetailViewModel)
	func setBuyButton(title: String)
	func setDeleteButton(title: String)
}

final class ProductDetailViewController: BaseViewController {
	
	// MARK: VIPER Dependencies
	var presenter: ProductDetailPresenterProtocol? { return super.basePresenter as? ProductDetailPresenterProtocol }
		
	// MARK: IBOutlets declaration of all controls
	@IBOutlet weak var modelLabel: UILabel!
	@IBOutlet weak var productImageView: UIImageView!
	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var bottomButton: UIButton!
	
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
	
	// MARK: UIViewController Functions
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.setNavigationBar()
	}
	
	override func initializeUI() {
		self.bottomButton.roundedByDefault()
	}
	
	// MARK: IBActions declaration of all the controls
	@IBAction func bottomButtonPressed(_ sender: Any) {
		self.presenter?.bottomButtonPressed()
	}
	
	// MARK: Private Functions
	func setNavigationBar() {
		self.navigationBarManager?.configureNavigationBar(model: NavigationBarModel(title: self.title))
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductDetailViewController: ProductDetailViewControllerProtocol {
	
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? ProductDetailViewModel else { return }
		self.title = model.screenTitle
	}
	
	func setUpProductDetail(_ viewModel: ProductDetailViewModel) {
		self.modelLabel.text = viewModel.productModel
		self.productImageView.image = Utils.imgBase64Decode(viewModel.productImageEncoded)
		self.priceLabel.text = (viewModel.productPrice ?? "") + " €"
		self.descriptionLabel.text = viewModel.productDescription
	}
	
	func setBuyButton(title: String) {
		self.bottomButton.setTitle(title, for: .normal)
	}
	
	func setDeleteButton(title: String) {
		self.bottomButton.setTitle(title, for: .normal)
	}
}
