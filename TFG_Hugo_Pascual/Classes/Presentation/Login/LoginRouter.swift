//  
//  LoginRouter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation

protocol LoginRouterProtocol: BaseRouterProtocol {
	func navigateToRegistration()
	func backToPreviousScreen(completion: (() -> Swift.Void)?)
}

class LoginRouter: BaseRouter {
	
	// MARK: VIPER Dependencies
	weak var view: LoginViewControllerProtocol? { return super.baseView as? LoginViewControllerProtocol }
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension LoginRouter: LoginRouterProtocol {
	
	func navigateToRegistration() {
		self.pushViewController(RegistrationAssembly.view(), animated: true)
	}
	
	func backToPreviousScreen(completion: (() -> Swift.Void)?) {
		self.dismiss(animated: true, completion: completion)
	}
}
