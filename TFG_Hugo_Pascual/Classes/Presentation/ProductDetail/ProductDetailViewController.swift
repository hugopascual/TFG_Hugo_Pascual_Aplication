//
//  ProductDetailViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 16/01/2021.
//

import Foundation
import UIKit

protocol ProductDetailViewProtocol: BaseViewControllerProtocol {
	
}

class ProductDetailViewController: BaseViewController {
	
	// MARK: VIPER Dependencies
	var presenter: ProductDetailPresenterProtocol? { return super.basePresenter as? ProductDetailPresenterProtocol}
	
	// MARK: IBOutlets declaration of all controls
	@IBOutlet weak var titleLabel: UILabel!
	
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
	
	// MARK: UIViewController Functions
	override func initializeUI() {
		
	}
	
	// MARK: IBActions declaration of all the controls
	
	// MARK: Private Functions
	
}

extension ProductDetailViewController: ProductDetailViewProtocol {

	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? ProductDetailViewModel else { return }
		
		self.title = model.screenTitle
		self.titleLabel.text = self.title
	}
}
