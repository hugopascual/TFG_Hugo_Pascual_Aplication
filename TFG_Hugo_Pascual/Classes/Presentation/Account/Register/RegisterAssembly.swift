//  
//  RegisterAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation
import UIKit

class RegisterAssembly: BaseAssembly {
	
	static func navigationController(dto: RegisterAssemblyDTO? = nil) -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view(dto: dto))
		return navigationController
	}

	static func view(dto: RegisterAssemblyDTO? = nil) -> RegisterViewController {

		let view = RegisterViewController(nibName: Utils.getXib(.register), bundle: nil)

		let viper = BaseAssembly.assembly(baseView: view,
										  presenter: RegisterPresenter.self,
										  router: RegisterRouter.self,
										  interactor: RegisterInteractor.self)
		
		viper.interactor.assemblyDTO = dto
		viper.interactor.userProvider = UserProvider()
		
		return view
	}
}

//Struct that represents the transfer object of Register
struct RegisterAssemblyDTO {
	
}
