//  
//  RegistrationViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 08/02/2021.
//

import Foundation
import UIKit

protocol RegistrationViewControllerProtocol: BaseViewControllerProtocol {
	
}

class RegistrationViewController: BaseViewController {
	
	// MARK: VIPER Dependencies
	var presenter: RegistrationPresenterProtocol? { return super.basePresenter as? RegistrationPresenterProtocol }
		
	// MARK: IBOutlets declaration of all controls
	
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
	
	// MARK: UIViewController Functions
	override func initializeUI() {
		
	}
	
	// MARK: IBActions declaration of all the controls
	
	// MARK: Private Functions
	
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension RegistrationViewController: RegistrationViewControllerProtocol {
	
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? RegistrationViewModel else { return }
		self.title = model.screenTitle
		
	}
}
