//  
//  ProductDetailAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation
import UIKit

class ProductDetailAssembly: BaseAssembly {
	
	static func navigationController(dto: ProductDetailAssemblyDTO? = nil) -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view(dto: dto))
		return navigationController
	}

	static func view(dto: ProductDetailAssemblyDTO? = nil) -> ProductDetailViewController {

		let view = ProductDetailViewController(nibName: Utils.getXib(.productDetail), bundle: nil)

		let viper = BaseAssembly.assembly(baseView: view,
										  presenter: ProductDetailPresenter.self,
										  router: ProductDetailRouter.self,
										  interactor: ProductDetailInteractor.self)
		
		viper.interactor.assemblyDTO = dto
		viper.interactor.productProvider = DataAssembly.productProvider(interactor: viper.interactor)
		
		return view
	}
}

//Struct that represents the transfer object of ProductDetail
struct ProductDetailAssemblyDTO {
	var productId: Int?
}
