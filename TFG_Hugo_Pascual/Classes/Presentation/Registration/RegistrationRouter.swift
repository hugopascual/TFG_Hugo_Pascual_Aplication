//  
//  RegistrationRouter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation

protocol RegistrationRouterProtocol: BaseRouterProtocol {

}

class RegistrationRouter: BaseRouter {
	
	// MARK: VIPER Dependencies
	weak var view: RegistrationViewControllerProtocol? { return super.baseView as? RegistrationViewControllerProtocol }
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension RegistrationRouter: RegistrationRouterProtocol {

}
