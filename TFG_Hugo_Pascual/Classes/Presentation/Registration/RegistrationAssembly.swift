//
//  RegistrationAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 04/02/2021.
//

import Foundation
import UIKit

final class RegistrationAssembly: BaseAssembly {
	
	static func navigationController() -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view())
		return navigationController
	}
	
	static func view() -> RegistrationViewController {
		let view = RegistrationViewController(nibName: Utils.getXib(.addProduct), bundle: nil)
		
		let viper = BaseAssembly.assembly(baseView: view,
										  presenter: RegistrationPresenter.self,
										  router: RegistrationRouter.self,
										  interactor: RegistrationInteractor.self)
		
		return view
	}
}

