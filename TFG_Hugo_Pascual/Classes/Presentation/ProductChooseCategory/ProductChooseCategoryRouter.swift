//  
//  ProductChooseCategoryRouter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 27/04/2021.
//

import Foundation

protocol ProductChooseCategoryRouterProtocol: BaseRouterProtocol {
	func navigateBack()
}

class ProductChooseCategoryRouter: BaseRouter {
	
	// MARK: VIPER Dependencies
	weak var view: ProductChooseCategoryViewControllerProtocol? { return super.baseView as? ProductChooseCategoryViewControllerProtocol }
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductChooseCategoryRouter: ProductChooseCategoryRouterProtocol {
	
	func navigateBack() {
		self.dismiss(animated: true)
	}
}
