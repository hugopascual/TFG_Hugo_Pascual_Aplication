//  
//  AddProductAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation
import UIKit

class AddProductAssembly: BaseAssembly {
	
	static func navigationController(dto: AddProductAssemblyDTO? = nil) -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view(dto: dto))
		return navigationController
	}

	static func view(dto: AddProductAssemblyDTO? = nil) -> AddProductViewController {

		let view = AddProductViewController(nibName: Utils.getXib(.), bundle: nil)

		let viper = BaseAssembly.assembly(baseView: view,
										  presenter: AddProductPresenter.self,
										  router: AddProductRouter.self,
										  interactor: AddProductInteractor.self)
		
		viper.interactor.assemblyDTO = dto
		
		return view
	}
}

//Struct that represents the transfer object of AddProduct
struct AddProductAssemblyDTO {
	
}
