//  
//  RegisterRouter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation

protocol RegisterRouterProtocol: BaseRouterProtocol {

}

class RegisterRouter: BaseRouter {
	
	// MARK: VIPER Dependencies
	weak var view: RegisterViewControllerProtocol? { return super.baseView as? RegisterViewControllerProtocol }
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension RegisterRouter: RegisterRouterProtocol {

}
