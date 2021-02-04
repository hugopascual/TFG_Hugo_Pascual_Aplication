//
//  RegistrationRouter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 04/02/2021.
//

import Foundation

protocol RegistrationRouterProtocol: BaseRouterProtocol {
	
}

class RegistrationRouter: BaseRouter {
	
	weak var view: RegistrationViewControllerProtocol? { return super.baseView as? RegistrationViewControllerProtocol }
	
}

extension RegistrationRouter: RegistrationRouterProtocol {
	
}
