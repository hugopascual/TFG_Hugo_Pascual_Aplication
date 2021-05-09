//  
//  ProductsListRouter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

protocol ProductsListRouterProtocol: BaseRouterProtocol {
	func navigateToProductDetail(id: Int)
}

class ProductsListRouter: BaseRouter {
	
	// MARK: VIPER Dependencies
	weak var view: ProductsListViewControllerProtocol? { return super.baseView as? ProductsListViewControllerProtocol }
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductsListRouter: ProductsListRouterProtocol {
	
	func navigateToProductDetail(id: Int) {
		self.pushViewController(ProductDetailAssembly.view(dto: ProductDetailAssemblyDTO(productId: id)), animated: true)
	}
}
