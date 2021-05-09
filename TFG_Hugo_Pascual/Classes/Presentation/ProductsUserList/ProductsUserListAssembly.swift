//  
//  ProductsUserListAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 09/05/2021.
//

import Foundation
import UIKit

class ProductsUserListAssembly: BaseAssembly {
	
	static func navigationController(dto: ProductsUserListAssemblyDTO? = nil) -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view(dto: dto))
		return navigationController
	}

	static func view(dto: ProductsUserListAssemblyDTO? = nil) -> ProductsListViewController {

		let view = ProductsListViewController(nibName: Utils.getXib(.productList), bundle: nil)

		let viper = BaseAssembly.assembly(baseView: view,
										  presenter: ProductsUserListPresenter.self,
										  router: ProductsListRouter.self,
										  interactor: ProductsUserListInteractor.self)
		
		viper.interactor.assemblyDTO = dto
		viper.interactor.productProvider = DataAssembly.productProvider(interactor: viper.interactor)
		
		return view
	}
}

//Struct that represents the transfer object of ProductsUserList
struct ProductsUserListAssemblyDTO {

}
