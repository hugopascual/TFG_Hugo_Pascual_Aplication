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
	func setDeleteButton(title: String)
	func hideDeleteButton()
}

final class ProductDetailViewController: BaseViewController {
	
	// MARK: VIPER Dependencies
	var presenter: ProductDetailPresenterProtocol? { return super.basePresenter as? ProductDetailPresenterProtocol }
		
	// MARK: IBOutlets declaration of all controls
	@IBOutlet weak var modelLabel: UILabel!
	@IBOutlet weak var productImageView: UIImageView!
	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var ownerContactTitleLabel: UILabel!
	@IBOutlet weak var ownerContactEmailLabel: UILabel!
	
	@IBOutlet weak var deleteButton: UIButton!
	@IBOutlet weak var buttonView: UIView!
	@IBOutlet weak var buttonViewTopToScrollViewBottomConstraint: NSLayoutConstraint!
	
	@IBOutlet weak var scrollViewBottomToContainerViewBottomConstraint: NSLayoutConstraint!
	
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
	
	// MARK: UIViewController Functions
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.setNavigationBar()
	}
	
	override func initializeUI() {
		self.deleteButton.roundedByDefault()
		self.deleteButton.setTitleColor(CustomColor.textNormal.uiColor, for: .normal)
	}
	
	// MARK: IBActions declaration of all the controls
	@IBAction func deleteButtonPressed(_ sender: Any) {
		self.presenter?.deleteButtonPressed()
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
		
		self.ownerContactTitleLabel.text = model.ownerContactTitle
	}
	
	func setUpProductDetail(_ viewModel: ProductDetailViewModel) {
		self.modelLabel.text = viewModel.productModel
		self.productImageView.image = Utils.imgBase64Decode(viewModel.productImageEncoded)
		self.priceLabel.text = (viewModel.productPrice ?? "") + " €"
		self.descriptionLabel.text = viewModel.productDescription
		self.ownerContactEmailLabel.text = viewModel.ownerContactEmail
	}
	
	func setDeleteButton(title: String) {
		self.buttonView.isHidden = false
		self.scrollViewBottomToContainerViewBottomConstraint.isActive = false
		self.buttonViewTopToScrollViewBottomConstraint.isActive = true
		self.deleteButton.setTitle(title, for: .normal)
	}
	
	func hideDeleteButton() {
		self.buttonView.isHidden = true
		self.buttonViewTopToScrollViewBottomConstraint.isActive = false
		self.scrollViewBottomToContainerViewBottomConstraint.isActive = true
	}
}
