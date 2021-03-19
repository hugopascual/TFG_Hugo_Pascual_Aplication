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
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var loginButton: UIButton!
	@IBOutlet weak var registrationButton: UIButton!
	
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
	
	// MARK: UIViewController Functions
	override func viewWillAppear(_ animated: Bool) {
		self.navigationBarManager?.configureNavigationBar(model: NavigationBarModel(arrayLeftButtons: [.closeButton], backGroundColor: CustomColor.viewPrimary.uiColor, isTransparent: true))
	}

	// MARK: IBActions declaration of all the controls
	@IBAction func loginButtonPressed(_ sender: Any) {
		self.presenter?.loginButtonPressed(email: emailTextField.text, password: passwordTextField.text)
	}
	
	@IBAction func registrationButtonPressed(_ sender: Any) {
		self.presenter?.registrationButtonPressed()
	}
	
	// MARK: Private Functions
	override func navigationBarLeftButtonItemPressed(buttonItem: NavigationBarButtonItem) {
		self.presenter?.buttonClosePressed()
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension LoginViewController: LoginViewControllerProtocol {
	
	func setViewModel(_ viewModel: Any) {
		guard let model = viewModel as? LoginViewModel else { return }
		self.title = model.screenTitle
		
		self.loginButton.setTitle(model.loginButtonTitle, for: .normal)
		self.registrationButton.setTitle(model.registrationButtonTittle, for: .normal)
	}
}
