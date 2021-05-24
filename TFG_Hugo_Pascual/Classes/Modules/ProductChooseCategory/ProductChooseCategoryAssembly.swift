//  
//  ProductChooseCategoryAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 27/04/2021.
//

import Foundation
import UIKit

class ProductChooseCategoryAssembly: BaseAssembly {
	
	static func navigationController(dto: ProductChooseCategoryAssemblyDTO? = nil) -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view(dto: dto))
		return navigationController
	}

	static func view(dto: ProductChooseCategoryAssemblyDTO? = nil) -> ProductChooseCategoryViewController {

		let view = ProductChooseCategoryViewController(nibName: Utils.getXib(.productChooseCategory), bundle: nil)

		let viper = BaseAssembly.assembly(baseView: view,
										  presenter: ProductChooseCategoryPresenter.self,
										  router: ProductChooseCategoryRouter.self,
										  interactor: ProductChooseCategoryInteractor.self)
		
		viper.interactor.assemblyDTO = dto
		
		return view
	}
}

//Struct that represents the transfer object of ProductChooseCategory
struct ProductChooseCategoryAssemblyDTO {
	var categorySelected: ((_ category: ProductCategory) -> Void)?
}
