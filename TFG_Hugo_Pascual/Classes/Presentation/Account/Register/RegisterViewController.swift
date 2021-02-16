//  
//  RegisterViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation
import UIKit

protocol RegisterViewControllerProtocol: BaseViewControllerProtocol {
	
}

final class RegisterViewController: BaseViewController {
	
	// MARK: VIPER Dependencies
	var presenter: RegisterPresenterProtocol? { return super.basePresenter as? RegisterPresenterProtocol }
		
	// MARK: IBOutlets declaration of all controls
	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
	
	// MARK: UIViewController Functions
	override func initializeUI() {
		
	}
	
	// MARK: IBActions declaration of all the controls
	
	@IBAction func sendButtonPressed(_ sender: Any) {
		self.presenter?.registerButtonPressed(email: self.emailTextField.text ?? "",
											  username: self.usernameTextField.text ?? "",
											  password: self.passwordTextField.text ?? "")
	}
	
	// MARK: Private Functions
	
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension RegisterViewController: RegisterViewControllerProtocol {
	
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? RegisterViewModel else { return }
		self.title = model.screenTitle
	}
}
