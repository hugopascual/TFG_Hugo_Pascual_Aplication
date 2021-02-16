//  
//  LoginRouter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation

protocol LoginRouterProtocol: BaseRouterProtocol {
	
}

class LoginRouter: BaseRouter {
	
	// MARK: VIPER Dependencies
	weak var view: LoginViewControllerProtocol? { return super.baseView as? LoginViewControllerProtocol }
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension LoginRouter: LoginRouterProtocol {
	
}
