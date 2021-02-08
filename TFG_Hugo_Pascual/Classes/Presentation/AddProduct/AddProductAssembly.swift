//
//  AddProductAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 14/01/2021.
//

import Foundation
import UIKit

final class AddProductAssembly: BaseAssembly {
	
	static func navigationController() -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view())
		return navigationController
	}
	
	static func view(dto: AddProductAssemblyDTO? = nil ) -> AddProductViewController {
		let view = AddProductViewController(nibName: Utils.getXib(.addProduct), bundle: nil)
		
		let viper = BaseAssembly.assembly(baseView: view,
										  presenter: AddProductPresenter.self,
										  router: AddProductRouter.self,
										  interactor: AddProductInteractor.self)
		
		viper.interactor.assemblyDTO = dto
		
		return view
	}
}

struct AddProductAssemblyDTO {
	
}
