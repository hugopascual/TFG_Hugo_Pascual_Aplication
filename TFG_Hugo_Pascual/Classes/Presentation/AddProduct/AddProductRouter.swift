//  
//  AddProductRouter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

protocol AddProductRouterProtocol: BaseRouterProtocol {
	func presentChooseCategoryModal(dto: ProductChooseCategoryAssemblyDTO)
	func back()
}

class AddProductRouter: BaseRouter {
	
	// MARK: VIPER Dependencies
	weak var view: AddProductViewControllerProtocol? { return super.baseView as? AddProductViewControllerProtocol }
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension AddProductRouter: AddProductRouterProtocol {

	func presentChooseCategoryModal(dto: ProductChooseCategoryAssemblyDTO) {
//		self.present(ProductChooseCategoryAssembly.view(), animated: true)
		self.pushViewController(ProductChooseCategoryAssembly.view(dto: dto), animated: true)
	}
	
	func back() {
		self.popViewController(animated: true)
	}
}
