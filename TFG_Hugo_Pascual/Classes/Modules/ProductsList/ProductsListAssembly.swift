//  
//  ProductsListAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation
import UIKit

class ProductsListAssembly: BaseAssembly {
	
	static func navigationController(dto: ProductsListAssemblyDTO? = nil) -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view(dto: dto))
		return navigationController
	}

	static func view(dto: ProductsListAssemblyDTO? = nil) -> ProductsListViewController {

		let view = ProductsListViewController(nibName: Utils.getXib(.productList), bundle: nil)

		let viper = BaseAssembly.assembly(baseView: view,
										  presenter: ProductsListPresenter.self,
										  router: ProductsListRouter.self,
										  interactor: ProductsListInteractor.self)
		
		viper.interactor.assemblyDTO = dto
		viper.interactor.productProvider = DataAssembly.productProvider(interactor: viper.interactor)

		return view
	}
}

//Struct that represents the transfer object of ProductsList
struct ProductsListAssemblyDTO {
	var listCategory: ProductCategory?
}
