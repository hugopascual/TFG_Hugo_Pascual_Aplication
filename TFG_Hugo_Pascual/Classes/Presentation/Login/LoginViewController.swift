//  
//  LoginViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation
import UIKit

protocol LoginViewControllerProtocol: BaseViewControllerProtocol {
	
}

final class LoginViewController: BaseViewController {
	
	// MARK: VIPER Dependencies
	var presenter: LoginPresenterProtocol? { return super.basePresenter as? LoginPresenterProtocol }
		
	// MARK: IBOutlets declaration of all controls
	
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
	
	// MARK: UIViewController Functions
	override func initializeUI() {
		
	}
	
	// MARK: IBActions declaration of all the controls
	
	// MARK: Private Functions
	
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension LoginViewController: LoginViewControllerProtocol {
	
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? LoginViewModel else { return }
		self.title = model.screenTitle
	}
}
