//  
//  ProductListViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 20/02/2021.
//

import Foundation
import UIKit

protocol ProductListViewControllerProtocol: BaseViewControllerProtocol {
	
}

final class ProductListViewController: BaseViewController {
	
	// MARK: VIPER Dependencies
	var presenter: ProductListPresenterProtocol? { return super.basePresenter as? ProductListPresenterProtocol }
		
	// MARK: IBOutlets declaration of all controls
	
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
	
	// MARK: UIViewController Functions
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: animated)
	}
	
	// MARK: IBActions declaration of all the controls
	
	// MARK: Private Functions
	
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductListViewController: ProductListViewControllerProtocol {
	
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? ProductListViewModel else { return }
		self.title = model.screenTitle
	}
}
