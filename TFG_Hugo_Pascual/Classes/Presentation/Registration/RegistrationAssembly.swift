//  
//  RegistrationAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation
import UIKit

class RegistrationAssembly: BaseAssembly {
	
	static func navigationController(dto: RegistrationAssemblyDTO? = nil) -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view(dto: dto))
		return navigationController
	}

	static func view(dto: RegistrationAssemblyDTO? = nil) -> RegistrationViewController {

		let view = RegistrationViewController(nibName: Utils.getXib(.registration), bundle: nil)

		let viper = BaseAssembly.assembly(baseView: view,
										  presenter: RegistrationPresenter.self,
										  router: RegistrationRouter.self,
										  interactor: RegistrationInteractor.self)
		
		viper.interactor.assemblyDTO = dto
		viper.interactor.userProvider = UserProvider()
		
		return view
	}
}

//Struct that represents the transfer object of Registration
struct RegistrationAssemblyDTO {
	
}
