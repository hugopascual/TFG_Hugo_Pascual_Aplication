//  
//  ProductListAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 20/02/2021.
//

import Foundation
import UIKit

class ProductListAssembly: BaseAssembly {
	
	static func navigationController(dto: ProductListAssemblyDTO? = nil) -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view(dto: dto))
		return navigationController
	}

	static func view(dto: ProductListAssemblyDTO? = nil) -> ProductListViewController {

		let view = ProductListViewController(nibName: Utils.getXib(.productList), bundle: nil)

		let viper = BaseAssembly.assembly(baseView: view,
										  presenter: ProductListPresenter.self,
										  router: ProductListRouter.self,
										  interactor: ProductListInteractor.self)
		
		viper.interactor.assemblyDTO = dto
		
		return view
	}
}

//Struct that represents the transfer object of ProductList
struct ProductListAssemblyDTO {
	
}
