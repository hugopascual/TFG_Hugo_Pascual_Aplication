//  
//  ProductsListViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation
import UIKit

protocol ProductsListViewControllerProtocol: BaseViewControllerProtocol {
	
}

final class ProductsListViewController: BaseViewController {
	
	// MARK: VIPER Dependencies
	var presenter: ProductsListPresenterProtocol? { return super.basePresenter as? ProductsListPresenterProtocol }
		
	// MARK: IBOutlets declaration of all controls
	
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
	
	// MARK: UIViewController Functions
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.setNavigationBar()
	}

	override func initializeUI() {
		
	}
	
	// MARK: IBActions declaration of all the controls
	
	// MARK: Private Functions
	func setNavigationBar() {
		self.navigationBarManager?.configureNavigationBar(model: NavigationBarModel(title: self.title))
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductsListViewController: ProductsListViewControllerProtocol {
	
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? ProductsListViewModel else { return }
		self.title = model.screenTitle
	}
}
