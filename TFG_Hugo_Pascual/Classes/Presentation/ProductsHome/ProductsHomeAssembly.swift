//  
//  ProductsHomeAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 20/04/2021.
//

import Foundation
import UIKit

class ProductsHomeAssembly: BaseAssembly {
	
	static func navigationController(dto: ProductsHomeAssemblyDTO? = nil) -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view(dto: dto))
		return navigationController
	}

	static func view(dto: ProductsHomeAssemblyDTO? = nil) -> ProductsHomeViewController {

		let view = ProductsHomeViewController(nibName: Utils.getXib(.productsHome), bundle: nil)

		let viper = BaseAssembly.assembly(baseView: view,
										  presenter: ProductsHomePresenter.self,
										  router: ProductsHomeRouter.self,
										  interactor: ProductsHomeInteractor.self)
		
		viper.interactor.assemblyDTO = dto
		
		return view
	}
}

//Struct that represents the transfer object of ProductsHome
struct ProductsHomeAssemblyDTO {
	
}
