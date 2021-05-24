//  
//  LoginAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation
import UIKit

class LoginAssembly: BaseAssembly {
	
	static func navigationController(dto: LoginAssemblyDTO? = nil) -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view(dto: dto))
		return navigationController
	}

	static func view(dto: LoginAssemblyDTO? = nil) -> LoginViewController {

		let view = LoginViewController(nibName: Utils.getXib(.login), bundle: nil)

		let viper = BaseAssembly.assembly(baseView: view,
										  presenter: LoginPresenter.self,
										  router: LoginRouter.self,
										  interactor: LoginInteractor.self)
		
		viper.interactor.assemblyDTO = dto
		viper.interactor.loginProvider = DataAssembly.loginProvider(interactor: viper.interactor)
		
		return view
	}
}

//Struct that represents the transfer object of Login
struct LoginAssemblyDTO {
	var loginSuccess: (() -> Void)?
	var loginClosed: (() -> Void)?
}
