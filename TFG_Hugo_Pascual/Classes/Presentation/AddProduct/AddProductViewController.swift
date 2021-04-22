//  
//  AddProductViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation
import UIKit

protocol AddProductViewControllerProtocol: BaseViewControllerProtocol {
	
}

final class AddProductViewController: BaseViewController {
	
	// MARK: VIPER Dependencies
	var presenter: AddProductPresenterProtocol? { return super.basePresenter as? AddProductPresenterProtocol }
		
	// MARK: IBOutlets declaration of all controls
	
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
	
	// MARK: UIViewController Functions
	override func initializeUI() {
		
	}
	
	// MARK: IBActions declaration of all the controls
	
	// MARK: Private Functions
	
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension AddProductViewController: AddProductViewControllerProtocol {
	
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? AddProductViewModel else { return }
		self.title = model.screenTitle
	}
}
