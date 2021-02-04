//
//  ProductDetailAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 16/01/2021.
//

import Foundation
import UIKit

final class ProductDetailAssembly: BaseAssembly {
	
	static func navigationController() -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view())
		return navigationController
	}
	
	static func view() -> ProductDetailViewController {
		let view = ProductDetailViewController(nibName: Utils.getXib(.addProduct), bundle: nil)
		
		let viper = BaseAssembly.assembly(baseView: view,
										  presenter: ProductDetailPresenter.self,
										  router: ProductDetailRouter.self,
										  interactor: ProductDetailInteractor.self)
		
		return view
	}
}
